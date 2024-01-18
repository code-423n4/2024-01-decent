// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Owned} from "solmate/auth/Owned.sol";
import {SwapParams} from "./swappers/SwapParams.sol";
import {IUTBExecutor} from "./interfaces/IUTBExecutor.sol";
import {IERC20} from "forge-std/interfaces/IERC20.sol";
import {IWETH} from "decent-bridge/src/interfaces/IWETH.sol";
import {IUTBFeeCollector} from "./interfaces/IUTBFeeCollector.sol";
import {IBridgeAdapter} from "./interfaces/IBridgeAdapter.sol";
import {ISwapper} from "./interfaces/ISwapper.sol";
import {SwapInstructions, FeeStructure, BridgeInstructions, SwapAndExecuteInstructions} from "./CommonTypes.sol";


contract UTB is Owned {
    constructor() Owned(msg.sender) {}

    IUTBExecutor executor;
    IUTBFeeCollector feeCollector;
    IWETH wrapped;
    mapping(uint8 => address) public swappers;
    mapping(uint8 => address) public bridgeAdapters;

    /**
     * @dev Sets the executor.
     * @param _executor The address of the executor.
     */
    function setExecutor(address _executor) public onlyOwner {
        executor = IUTBExecutor(_executor);
    }

    /**
     * @dev Sets the wrapped native token.
     * @param _wrapped The address of the wrapped token.
     */
    function setWrapped(address payable _wrapped) public onlyOwner {
        wrapped = IWETH(_wrapped);
    }

    /**
     * @dev Sets the fee collector.
     * @param _feeCollector The address of the fee collector.
     */
    function setFeeCollector(address payable _feeCollector) public onlyOwner {
        feeCollector = IUTBFeeCollector(_feeCollector);
    }

    /**
     * @dev Performs a swap with a default setting to retrieve ERC20.
     * @param swapInstructions The swapper ID and calldata to execute a swap.
     */
    function performSwap(
        SwapInstructions memory swapInstructions
    ) private returns (address tokenOut, uint256 amountOut) {
        return performSwap(swapInstructions, true);
    }

    /**
     * @dev Performs a swap with the requested swapper and swap calldata.
     * @param swapInstructions The swapper ID and calldata to execute a swap.
     * @param retrieveTokenIn Flag indicating whether to transfer ERC20 for the swap.
     */
    function performSwap(
        SwapInstructions memory swapInstructions,
        bool retrieveTokenIn
    ) private returns (address tokenOut, uint256 amountOut) {
        ISwapper swapper = ISwapper(swappers[swapInstructions.swapperId]);

        SwapParams memory swapParams = abi.decode(
            swapInstructions.swapPayload,
            (SwapParams)
        );

        if (swapParams.tokenIn == address(0)) {
            require(msg.value >= swapParams.amountIn, "not enough native");
            wrapped.deposit{value: swapParams.amountIn}();
            swapParams.tokenIn = address(wrapped);
            swapInstructions.swapPayload = swapper.updateSwapParams(
                swapParams,
                swapInstructions.swapPayload
            );
        } else if (retrieveTokenIn) {
            IERC20(swapParams.tokenIn).transferFrom(
                msg.sender,
                address(this),
                swapParams.amountIn
            );
        }

        IERC20(swapParams.tokenIn).approve(
            address(swapper),
            swapParams.amountIn
        );

        (tokenOut, amountOut) = swapper.swap(swapInstructions.swapPayload);

        if (tokenOut == address(0)) {
            wrapped.withdraw(amountOut);
        }
    }

    /**
     * @dev Swaps currency from the incoming to the outgoing token and executes a transaction with payment.
     * @param instructions The token swap data and payment transaction payload.
     * @param fees The bridge fee in native, as well as utb fee token and amount.
     * @param signature The ECDSA signature to verify the fee structure.
     */
    function swapAndExecute(
        SwapAndExecuteInstructions calldata instructions,
        FeeStructure calldata fees,
        bytes calldata signature
    )
        public
        payable
        retrieveAndCollectFees(fees, abi.encode(instructions, fees), signature)
    {
        _swapAndExecute(
            instructions.swapInstructions,
            instructions.target,
            instructions.paymentOperator,
            instructions.payload,
            instructions.refund
        );
    }

    /**
     * @dev Swaps currency from the incoming to the outgoing token and executes a transaction with payment.
     * @param swapInstructions The swapper ID and calldata to execute a swap.
     * @param target The address of the target contract for the payment transaction.
     * @param paymentOperator The operator address for payment transfers requiring ERC20 approvals.
     * @param payload The calldata to execute the payment transaction.
     * @param refund The account receiving any refunds, typically the EOA which initiated the transaction.
     */
    function _swapAndExecute(
        SwapInstructions memory swapInstructions,
        address target,
        address paymentOperator,
        bytes memory payload,
        address payable refund
    ) private {
        (address tokenOut, uint256 amountOut) = performSwap(swapInstructions);
        if (tokenOut == address(0)) {
            executor.execute{value: amountOut}(
                target,
                paymentOperator,
                payload,
                tokenOut,
                amountOut,
                refund
            );
        } else {
            IERC20(tokenOut).approve(address(executor), amountOut);
            executor.execute(
                target,
                paymentOperator,
                payload,
                tokenOut,
                amountOut,
                refund
            );
        }
    }

    /**
     * @dev Performs the pre bridge swap and modifies the post bridge swap to utilize the bridged amount.
     * @param instructions The bridge data, token swap data, and payment transaction payload.
     */
    function swapAndModifyPostBridge(
        BridgeInstructions memory instructions
    )
        private
        returns (
            uint256 amount2Bridge,
            BridgeInstructions memory updatedInstructions
        )
    {
        (address tokenOut, uint256 amountOut) = performSwap(
            instructions.preBridge
        );

        SwapParams memory newPostSwapParams = abi.decode(
            instructions.postBridge.swapPayload,
            (SwapParams)
        );

        newPostSwapParams.amountIn = IBridgeAdapter(
            bridgeAdapters[instructions.bridgeId]
        ).getBridgedAmount(amountOut, tokenOut, newPostSwapParams.tokenIn);

        updatedInstructions = instructions;

        updatedInstructions.postBridge.swapPayload = ISwapper(swappers[
            instructions.postBridge.swapperId
        ]).updateSwapParams(
            newPostSwapParams,
            instructions.postBridge.swapPayload
        );

        amount2Bridge = amountOut;
    }

    /**
     * @dev Checks if the bridge token is native, and approves the bridge adapter to transfer ERC20 if required.
     * @param instructions The bridge data, token swap data, and payment transaction payload.
     * @param amt2Bridge The amount of the bridge token being transferred to the bridge adapter.
     */
    function approveAndCheckIfNative(
        BridgeInstructions memory instructions,
        uint256 amt2Bridge
    ) private returns (bool) {
        IBridgeAdapter bridgeAdapter = IBridgeAdapter(bridgeAdapters[instructions.bridgeId]);
        address bridgeToken = bridgeAdapter.getBridgeToken(
            instructions.additionalArgs
        );
        if (bridgeToken != address(0)) {
            IERC20(bridgeToken).approve(address(bridgeAdapter), amt2Bridge);
            return false;
        }
        return true;
    }

    /**
     * @dev Transfers fees from the sender to UTB, and finally to the Fee Collector.
     * @param fees The bridge fee in native, as well as utb fee token and amount.
     * @param packedInfo The fees and swap instructions which were used to generate the signature.
     * @param signature The ECDSA signature to verify the fee structure.
     */
    modifier retrieveAndCollectFees(
        FeeStructure calldata fees,
        bytes memory packedInfo,
        bytes calldata signature
    ) {
        if (address(feeCollector) != address(0)) {
            uint value = 0;
            if (fees.feeToken != address(0)) {
                IERC20(fees.feeToken).transferFrom(
                    msg.sender,
                    address(this),
                    fees.feeAmount
                );
                IERC20(fees.feeToken).approve(
                    address(feeCollector),
                    fees.feeAmount
                );
            } else {
                value = fees.feeAmount;
            }
            feeCollector.collectFees{value: value}(fees, packedInfo, signature);
        }
        _;
    }

    /**
     * @dev Bridges funds in native or ERC20 and a payment transaction payload to the destination chain
     * @param instructions The bridge data, token swap data, and payment transaction payload.
     * @param fees The bridge fee in native, as well as utb fee token and amount.
     * @param signature The ECDSA signature to verify the fee structure.
     */
    function bridgeAndExecute(
        BridgeInstructions calldata instructions,
        FeeStructure calldata fees,
        bytes calldata signature
    )
        public
        payable
        retrieveAndCollectFees(fees, abi.encode(instructions, fees), signature)
        returns (bytes memory)
    {
        (
            uint256 amt2Bridge,
            BridgeInstructions memory updatedInstructions
        ) = swapAndModifyPostBridge(instructions);
        return callBridge(amt2Bridge, fees.bridgeFee, updatedInstructions);
    }

    /**
     * @dev Calls the bridge adapter to bridge funds, and approves the bridge adapter to transfer ERC20 if required.
     * @param amt2Bridge The amount of the bridge token being bridged via the bridge adapter.
     * @param bridgeFee The fee being transferred to the bridge adapter and finally to the bridge.
     * @param instructions The bridge data, token swap data, and payment transaction payload.
     */
    function callBridge(
        uint256 amt2Bridge,
        uint bridgeFee,
        BridgeInstructions memory instructions
    ) private returns (bytes memory) {
        bool native = approveAndCheckIfNative(instructions, amt2Bridge);
        return
            IBridgeAdapter(bridgeAdapters[instructions.bridgeId]).bridge{
                value: bridgeFee + (native ? amt2Bridge : 0)
            }(
                amt2Bridge,
                instructions.postBridge,
                instructions.dstChainId,
                instructions.target,
                instructions.paymentOperator,
                instructions.payload,
                instructions.additionalArgs,
                instructions.refund
            );
    }

    /**
     * @dev Receives funds from the bridge adapter, executes a swap, and executes a payment transaction.
     * @param postBridge The swapper ID and calldata to execute a swap.
     * @param target The address of the target contract for the payment transaction.
     * @param paymentOperator The operator address for payment transfers requiring ERC20 approvals.
     * @param payload The calldata to execute the payment transaction.
     * @param refund The account receiving any refunds, typically the EOA which initiated the transaction.
     */
    function receiveFromBridge(
        SwapInstructions memory postBridge,
        address target,
        address paymentOperator,
        bytes memory payload,
        address payable refund
    ) public {
        _swapAndExecute(postBridge, target, paymentOperator, payload, refund);
    }

    /**
     * @dev Registers and maps a swapper to a swapper ID.
     * @param swapper The address of the swapper.
     */
    function registerSwapper(address swapper) public onlyOwner {
        ISwapper s = ISwapper(swapper);
        swappers[s.getId()] = swapper;
    }

    /**
     * @dev Registers and maps a bridge adapter to a bridge adapter ID.
     * @param bridge The address of the bridge adapter.
     */
    function registerBridge(address bridge) public onlyOwner {
        IBridgeAdapter b = IBridgeAdapter(bridge);
        bridgeAdapters[b.getId()] = bridge;
    }

    receive() external payable {}

    fallback() external payable {}
}
