// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {IERC20} from "forge-std/interfaces/IERC20.sol";
import {IUTB} from "../interfaces/IUTB.sol";
import {IBridgeAdapter} from "../interfaces/IBridgeAdapter.sol";
import {SwapInstructions} from "../CommonTypes.sol";
import {SwapParams} from "../swappers/SwapParams.sol";
import {IDecentEthRouter} from "decent-bridge/src/interfaces/IDecentEthRouter.sol";
import {BaseAdapter} from "./BaseAdapter.sol";

contract DecentBridgeAdapter is BaseAdapter, IBridgeAdapter {
    uint8 public constant BRIDGE_ID = 0;
    mapping(uint256 => address) public destinationBridgeAdapter;
    IDecentEthRouter public router;
    mapping(uint256 => uint16) lzIdLookup;
    mapping(uint16 => uint256) chainIdLookup;
    bool gasIsEth;
    address bridgeToken;

    constructor(bool _gasIsEth, address _bridgeToken) BaseAdapter() {
        gasIsEth = _gasIsEth;
        bridgeToken = _bridgeToken;
    }

    function setRouter(address _router) public onlyOwner {
        router = IDecentEthRouter(payable(_router));
    }

    function getId() public pure returns (uint8) {
        return BRIDGE_ID;
    }

    function registerRemoteBridgeAdapter(
        uint256 dstChainId,
        uint16 dstLzId,
        address decentBridgeAdapter
    ) public onlyOwner {
        lzIdLookup[dstChainId] = dstLzId;
        chainIdLookup[dstLzId] = dstChainId;
        destinationBridgeAdapter[dstChainId] = decentBridgeAdapter;
    }

    function estimateFees(
        SwapInstructions memory postBridge,
        uint256 dstChainId,
        address target,
        uint64 dstGas,
        bytes memory payload
    ) public view returns (uint nativeFee, uint zroFee) {
        SwapParams memory swapParams = abi.decode(
            postBridge.swapPayload,
            (SwapParams)
        );
        return
            router.estimateSendAndCallFee(
                router.MT_ETH_TRANSFER_WITH_PAYLOAD(),
                lzIdLookup[dstChainId],
                target,
                swapParams.amountIn,
                dstGas,
                false,
                payload
            );
    }

    function getBridgeToken(
        bytes calldata /*additionalArgs*/
    ) external view returns (address) {
        return bridgeToken;
    }

    function getBridgedAmount(
        uint256 amt2Bridge,
        address /*tokenIn*/,
        address /*tokenOut*/
    ) external pure returns (uint256) {
        return amt2Bridge;
    }

    function bridge(
        uint256 amt2Bridge,
        SwapInstructions memory postBridge,
        uint256 dstChainId,
        address target,
        address paymentOperator,
        bytes memory payload,
        bytes calldata additionalArgs,
        address payable refund
    ) public payable onlyUtb returns (bytes memory bridgePayload) {
        require(
            destinationBridgeAdapter[dstChainId] != address(0),
            string.concat("dst chain address not set ")
        );

        uint64 dstGas = abi.decode(additionalArgs, (uint64));

        bridgePayload = abi.encodeCall(
            this.receiveFromBridge,
            (postBridge, target, paymentOperator, payload, refund)
        );

        SwapParams memory swapParams = abi.decode(
            postBridge.swapPayload,
            (SwapParams)
        );

        if (!gasIsEth) {
            IERC20(bridgeToken).transferFrom(
                msg.sender,
                address(this),
                amt2Bridge
            );
            IERC20(bridgeToken).approve(address(router), amt2Bridge);
        }

        router.bridgeWithPayload{value: msg.value}(
            lzIdLookup[dstChainId],
            destinationBridgeAdapter[dstChainId],
            swapParams.amountIn,
            false,
            dstGas,
            bridgePayload
        );
    }

    function receiveFromBridge(
        SwapInstructions memory postBridge,
        address target,
        address paymentOperator,
        bytes memory payload,
        address payable refund
    ) public onlyExecutor {
        SwapParams memory swapParams = abi.decode(
            postBridge.swapPayload,
            (SwapParams)
        );

        IERC20(swapParams.tokenIn).transferFrom(
            msg.sender,
            address(this),
            swapParams.amountIn
        );

        IERC20(swapParams.tokenIn).approve(utb, swapParams.amountIn);

        IUTB(utb).receiveFromBridge(
            postBridge,
            target,
            paymentOperator,
            payload,
            refund
        );
    }

    receive() external payable {}

    fallback() external payable {}
}
