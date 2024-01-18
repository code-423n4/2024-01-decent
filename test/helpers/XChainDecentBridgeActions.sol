// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {console2} from "forge-std/console2.sol";
import {UsdcHelper} from "forge-toolkit/UsdcHelper.sol";
import {BridgeParams} from "decent-bridge/test/common/RouterActions.sol";
import {ERC20} from "solmate/tokens/ERC20.sol";

import {IStargateRouter, LzBridgeData} from "../../src/bridge_adapters/stargate/IStargateRouter.sol";
import {SwapParams, SwapDirection} from "../../src/swappers/SwapParams.sol";
import {FeeStructure} from "../../src/CommonTypes.sol";
import {UTB, SwapInstructions, BridgeInstructions, SwapAndExecuteInstructions} from "../../src/UTB.sol";

import {UTBDeployHelper} from "./UTBDeployHelper.sol";
import {VeryCoolCat} from "./VeryCoolCat.sol";
import {DegenVault} from "./DegenVault.sol";
import {LoadAllChainInfo} from "forge-toolkit/LoadAllChainInfo.sol";
import {VmSafe} from "forge-std/Vm.sol";

struct XChainSwap {
    string src;
    string dst;
    address tokenIn;
    address srcBridgeToken;
    address dstBridgeToken;
    address tokenOut;
    uint256 amountIn;
    uint256 amountOut;
    uint preSlippage;
    uint postSlippage;
    uint bridgeFeeBps;
    address payable refund;
    address from;
    address target;
    address paymentOperator;
    uint64 gas;
    bytes callPayload;
}

contract XChainDecentBridgeActions is UTBDeployHelper {
    uint constant EXTRA_LZ_PERCENTAGE = 40;
    uint8 constant DECENT_BRIDGE_ID = 0;
    uint8 constant STARGATE_BRIDGE_ID = 1;
    uint constant STARGATE_FEE_BPS = 6; // 2 is the padding, some
    address feeToken = address(0);
    uint feeAmount = 0;
    string constant BANNER = "\x19Ethereum Signed Message:\n32";

    uint preSlippage;
    uint postSlippage;
    string src;
    string dst;
    uint APPROX_BALANCE = 0;
    uint initialEthBalance;
    uint initialWethBalance;
    uint initialNativeChainBalance;
    uint initialUsdcBalance;

    // sg function type https://stargateprotocol.gitbook.io/stargate/developers/function-types
    uint8 constant SG_FUNCTION_TYPE_SWAP_REMOTE = 1;

    function getSwapInstructions(
        XChainSwap memory xChainSwap,
        uint8 direction
    )
        private
        returns (
            SwapInstructions memory preBridgeSwap,
            SwapInstructions memory postBridgeSwap,
            uint256 preDifference,
            uint256 postDifference
        )
    {
        if (direction == SwapDirection.EXACT_OUT) {
            (
                preBridgeSwap,
                preDifference,
                postBridgeSwap,
                postDifference
            ) = getXChainSwapInstructionsExactOut(xChainSwap);
        } else {
            (
                preBridgeSwap,
                preDifference,
                postBridgeSwap,
                postDifference
            ) = getXChainSwapInstructionsExactIn(xChainSwap);
        }
    }

    function getLzTxObj(
        uint gas
    ) private pure returns (IStargateRouter.lzTxObj memory) {
        return
            IStargateRouter.lzTxObj({
                dstGasForCall: gas,
                dstNativeAmount: 0,
                dstNativeAddr: ""
            });
    }

    function addAdditionalArgs(
        SwapInstructions memory postBridgeSwap,
        XChainSwap memory xChainSwap,
        BridgeInstructions memory instructions
    ) private view returns (uint totalFees) {
        //LzBridgeData(uint120(13), uint120(13), uint16(101), address(coreOptimism), uint96(lzfee)),
        address bridgeToken = xChainSwap.srcBridgeToken;

        //look here: https://github.com/decentxyz/UTB/blob/main/test/Core.t.sol
        (totalFees, ) = IStargateRouter(sgRouterLookup[xChainSwap.src])
            .quoteLayerZeroFee(
                lzIdLookup[xChainSwap.dst],
                SG_FUNCTION_TYPE_SWAP_REMOTE,
                abi.encodePacked(
                    address(sgBridgeAdapterLookup[xChainSwap.dst])
                ),
                abi.encode( // adapter's payload
                        postBridgeSwap,
                        xChainSwap.target,
                        xChainSwap.callPayload,
                        xChainSwap.refund
                    ), // payload, using abi.encode()
                getLzTxObj(xChainSwap.gas)
            );

        totalFees = (totalFees * (100 + EXTRA_LZ_PERCENTAGE)) / 100;

        instructions.additionalArgs = abi.encode(
            bridgeToken,
            LzBridgeData({
                _srcPoolId: sgPoolIdLookup[xChainSwap.src][
                    xChainSwap.srcBridgeToken
                ],
                _dstPoolId: sgPoolIdLookup[xChainSwap.dst][
                    xChainSwap.dstBridgeToken
                ],
                _dstChainId: lzIdLookup[xChainSwap.dst], // 101 ?
                _bridgeAddress: address(sgBridgeAdapterLookup[xChainSwap.dst]),
                fee: uint96(totalFees)
            }),
            getLzTxObj(xChainSwap.gas)
        );
    }

    function getXChainStargateBridgeInstructions(
        XChainSwap memory xChainSwap,
        uint8 direction
    )
        private
        returns (
            BridgeInstructions memory instructions,
            uint totalFees,
            SwapInstructions memory preBridgeSwap,
            SwapInstructions memory postBridgeSwap,
            uint256 preDifference,
            uint256 postDifference
        )
    {
        (
            preBridgeSwap,
            postBridgeSwap,
            preDifference,
            postDifference
        ) = getSwapInstructions(xChainSwap, direction);

        switchTo(xChainSwap.src);

        instructions = BridgeInstructions({
            preBridge: preBridgeSwap,
            postBridge: postBridgeSwap,
            bridgeId: STARGATE_BRIDGE_ID,
            dstChainId: chainIdLookup[xChainSwap.dst],
            target: xChainSwap.target,
            paymentOperator: xChainSwap.paymentOperator,
            payload: xChainSwap.callPayload,
            additionalArgs: "",
            refund: xChainSwap.refund
        });

        totalFees = addAdditionalArgs(postBridgeSwap, xChainSwap, instructions);
    }

    function getXChainDecentBridgeInstructions(
        XChainSwap memory xChainSwap,
        uint8 direction
    )
        private
        returns (
            BridgeInstructions memory instructions,
            uint totalFees,
            SwapInstructions memory preBridgeSwap,
            SwapInstructions memory postBridgeSwap,
            uint256 preDifference,
            uint256 postDifference
        )
    {
        (
            preBridgeSwap,
            postBridgeSwap,
            preDifference,
            postDifference
        ) = getSwapInstructions(xChainSwap, direction);

        switchTo(xChainSwap.src);
        (uint nativeFee, uint zroFee) = decentBridgeAdapterLookup[
            xChainSwap.src
        ].estimateFees(
                postBridgeSwap,
                chainIdLookup[xChainSwap.dst],
                xChainSwap.target,
                xChainSwap.gas,
                xChainSwap.callPayload
            );

        totalFees = ((nativeFee + zroFee) * (100 + EXTRA_LZ_PERCENTAGE)) / 100;
        instructions = BridgeInstructions({
            preBridge: preBridgeSwap,
            postBridge: postBridgeSwap,
            bridgeId: DECENT_BRIDGE_ID,
            dstChainId: chainIdLookup[xChainSwap.dst],
            target: xChainSwap.target,
            paymentOperator: xChainSwap.paymentOperator,
            payload: xChainSwap.callPayload,
            additionalArgs: abi.encode(xChainSwap.gas),
            refund: xChainSwap.refund
        });
    }

    function getXChainSwapInstructionsExactIn(
        XChainSwap memory params
    )
        private
        returns (
            SwapInstructions memory preBridgeSwap,
            uint256 preExtraOut,
            SwapInstructions memory postBridgeSwap,
            uint256 postExtraOut
        )
    {
        (
            SwapParams memory preBridgeSwapParams,
            uint preExpectedAmountOut
        ) = getSwapParamsExactIn(
                params.src,
                params.tokenIn,
                params.amountIn,
                params.srcBridgeToken,
                params.preSlippage
            );

        preExtraOut = preExpectedAmountOut - preBridgeSwapParams.amountOut;

        (
            SwapParams memory postBridgeSwapParams,
            uint postExpectedAmountOut
        ) = getSwapParamsExactIn(
                params.dst,
                params.dstBridgeToken,
                (preBridgeSwapParams.amountOut *
                    (10000 - params.bridgeFeeBps)) / 10000,
                params.tokenOut,
                params.postSlippage
            );

        postExtraOut = postExpectedAmountOut - postBridgeSwapParams.amountOut;

        (preBridgeSwap, postBridgeSwap) = buildSwapInstructions(
            params.src,
            params.dst,
            preBridgeSwapParams,
            postBridgeSwapParams,
            params.refund
        );
    }

    function getXChainSwapInstructionsExactOut(
        XChainSwap memory params
    )
        private
        returns (
            SwapInstructions memory preBridgeSwap,
            uint256 preExtraIn,
            SwapInstructions memory postBridgeSwap,
            uint256 postExtraIn
        )
    {
        (
            SwapParams memory postBridgeSwapParams,
            uint postExpectedAmountIn
        ) = getSwapParamsExactOut(
                params.dst,
                params.dstBridgeToken,
                params.tokenOut,
                params.amountOut,
                params.postSlippage
            );

        postExtraIn = postBridgeSwapParams.amountIn - postExpectedAmountIn;

        uint preAmountOut = (postBridgeSwapParams.amountIn *
            (10000 + params.bridgeFeeBps)) / 10000;

        (
            SwapParams memory preBridgeSwapParams,
            uint preExpectedAmountIn
        ) = getSwapParamsExactOut(
                params.src,
                params.tokenIn,
                params.srcBridgeToken,
                preAmountOut,
                params.preSlippage
            );

        preExtraIn = preBridgeSwapParams.amountIn - preExpectedAmountIn;
        (preBridgeSwap, postBridgeSwap) = buildSwapInstructions(
            params.src,
            params.dst,
            preBridgeSwapParams,
            postBridgeSwapParams,
            params.refund
        );
    }

    function _debugSwaps(
        SwapParams memory preBridgeSwapParams,
        SwapParams memory postBridgeSwapParams
    ) private pure {
        console2.log(
            "preBridgeSwapParams.amountIn",
            preBridgeSwapParams.amountIn
        );
        console2.log(
            "preBridgeSwapParams.tokenIn",
            preBridgeSwapParams.tokenIn
        );
        console2.log(
            "preBridgeSwapParams.amountOut",
            preBridgeSwapParams.amountOut
        );
        console2.log(
            "preBridgeSwapParams.tokenOut",
            preBridgeSwapParams.tokenOut
        );
        console2.log(
            "preBridgeSwapParams.path",
            preBridgeSwapParams.path.length
        );
        console2.log(
            "postBridgeSwapParams.amountIn",
            postBridgeSwapParams.amountIn
        );
        console2.log(
            "postBridgeSwapParams.tokenIn",
            postBridgeSwapParams.tokenIn
        );
        console2.log(
            "postBridgeSwapParams.amountOut",
            postBridgeSwapParams.amountOut
        );
        console2.log(
            "postBridgeSwapParams.tokenOut",
            postBridgeSwapParams.tokenOut
        );
        console2.log(
            "postBridgeSwapParams.path",
            postBridgeSwapParams.path.length
        );
    }

    function buildSwapInstructions(
        string memory _src,
        string memory _dst,
        SwapParams memory preBridgeSwapParams,
        SwapParams memory postBridgeSwapParams,
        address refund
    )
        private
        returns (
            SwapInstructions memory preBridgeSwap,
            SwapInstructions memory postBridgeSwap
        )
    {
        _debugSwaps(preBridgeSwapParams, postBridgeSwapParams);

        switchTo(_src);
        preBridgeSwap = SwapInstructions({
            swapperId: swapperLookup[_src].getId(),
            swapPayload: abi.encode(
                preBridgeSwapParams,
                address(utbLookup[_src]),
                refund
            )
        });

        switchTo(_dst);

        postBridgeSwap = SwapInstructions({
            swapperId: swapperLookup[_dst].getId(),
            swapPayload: abi.encode(
                postBridgeSwapParams,
                address(utbLookup[_dst]),
                refund
            )
        });
    }

    function performXChain(
        XChainSwap memory xChainSwap,
        uint8 direction,
        uint8 bridgeId
    )
        public
        returns (
            uint256 preDifference,
            uint256 postDifference,
            uint256 lzFees,
            uint256 quotedAmount
        )
    {
        return performXChain(xChainSwap, direction, bridgeId, true);
    }

    function performXChain(
        XChainSwap memory xChainSwap,
        uint8 direction,
        uint8 bridgeId,
        bool receiveLz
    )
        public
        returns (
            uint256 preDifference,
            uint256 postDifference,
            uint256 lzFees,
            uint256 quotedAmount
        )
    {
        BridgeInstructions memory bridgeInstructions;
        if (bridgeId == DECENT_BRIDGE_ID) {
            (
                bridgeInstructions,
                lzFees,
                ,
                ,
                preDifference,
                postDifference
            ) = getXChainDecentBridgeInstructions(xChainSwap, direction);
        } else {
            (
                bridgeInstructions,
                lzFees,
                ,
                ,
                preDifference,
                postDifference
            ) = getXChainStargateBridgeInstructions(xChainSwap, direction);
        }

        SwapParams memory preSwapParams = abi.decode(
            bridgeInstructions.preBridge.swapPayload,
            (SwapParams)
        );

        switchTo(xChainSwap.src);

        if (direction == SwapDirection.EXACT_OUT) {
            quotedAmount = preSwapParams.amountIn;
        } else {
            SwapParams memory postSwapParams = abi.decode(
                bridgeInstructions.postBridge.swapPayload,
                (SwapParams)
            );
            quotedAmount = postSwapParams.amountOut;
        }

        callBridgeAndDeliverLzMessage(
            preSwapParams,
            xChainSwap,
            bridgeInstructions,
            lzFees,
            receiveLz
        );
    }

    function callBridgeAndDeliverLzMessage(
        SwapParams memory preSwapParams,
        XChainSwap memory xChainSwap,
        BridgeInstructions memory bridgeInstructions,
        uint256 lzFees,
        bool receiveLz
    ) private {
        uint bridgeValue = lzFees;

        UTB utb = utbLookup[xChainSwap.src];

        startImpersonating(xChainSwap.from);

        if (preSwapParams.tokenIn == address(0)) {
            bridgeValue += preSwapParams.amountIn;
        } else {
            ERC20(preSwapParams.tokenIn).approve(
                address(utb),
                preSwapParams.amountIn
            );
        }

        vm.recordLogs();

        (
            bytes memory signature,
            FeeStructure memory fees
        ) = getFeesAndSignature(bridgeInstructions, lzFees);

        if (feeToken == address(0)) {
            bridgeValue += feeAmount;
        } else {
            uint currAllowance = ERC20(feeToken).allowance(
                xChainSwap.from,
                address(utb)
            );
            ERC20(feeToken).approve(address(utb), currAllowance + feeAmount);
        }

        utb.bridgeAndExecute{value: bridgeValue}(
            bridgeInstructions,
            fees,
            signature
        );

        stopImpersonating();

        if (!receiveLz) {
            return;
        }

        deliverLzMessageAtDestination(
            xChainSwap.src,
            xChainSwap.dst,
            xChainSwap.gas
        );
    }

    function getSignature(
        bytes memory inputBytes
    ) public pure returns (bytes memory signature) {
        bytes32 constructedHash = keccak256(
            abi.encodePacked(BANNER, keccak256(inputBytes))
        );

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(
            SIGNER_PRIVATE_KEY,
            constructedHash
        );

        signature = abi.encodePacked(r, s, v);
    }

    function getFeesAndSignature(
        SwapAndExecuteInstructions memory instructions
    ) public view returns (bytes memory signature, FeeStructure memory fees) {
        fees = FeeStructure({
            bridgeFee: 0,
            feeAmount: feeAmount,
            feeToken: feeToken
        });

        signature = getSignature(abi.encode(instructions, fees));
    }

    function getFeesAndSignature(
        BridgeInstructions memory instructions,
        uint256 lzFees
    ) public view returns (bytes memory signature, FeeStructure memory fees) {
        fees = FeeStructure({
            bridgeFee: lzFees,
            feeAmount: feeAmount,
            feeToken: feeToken
        });

        signature = getSignature(abi.encode(instructions, fees));
    }

    function performXChainExactInAndReceiveDecentBridge(
        XChainSwap memory xChainSwap
    )
        public
        returns (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        )
    {
        return
            performXChain(xChainSwap, SwapDirection.EXACT_IN, DECENT_BRIDGE_ID);
    }

    function performXChainExactOutAndReceiveDecentBridge(
        XChainSwap memory xChainSwap
    )
        public
        returns (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        )
    {
        return
            performXChain(
                xChainSwap,
                SwapDirection.EXACT_OUT,
                DECENT_BRIDGE_ID
            );
    }

    function performXChainExactInAndReceiveStargateBridge(
        XChainSwap memory xChainSwap
    )
        public
        returns (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        )
    {
        return
            performXChain(
                xChainSwap,
                SwapDirection.EXACT_IN,
                STARGATE_BRIDGE_ID
            );
    }

    function performXChainExactOutAndReceiveStargateBridge(
        XChainSwap memory xChainSwap
    )
        public
        returns (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        )
    {
        return
            performXChain(
                xChainSwap,
                SwapDirection.EXACT_OUT,
                STARGATE_BRIDGE_ID
            );
    }

    function deployTheCat(
        string memory chain
    ) public returns (VeryCoolCat cat) {
        switchTo(chain);

        cat = VeryCoolCat(
            payable(
                deployChain(
                    chain,
                    "VeryCoolCat",
                    "VeryCoolCat.sol:VeryCoolCat",
                    ""
                )
            )
        );

        cat.setUsdc(getUsdc(chain));
        cat.setWeth(getWeth(chain));
        dump();
    }

    function deployTheVault(
        string memory chain
    ) public returns (DegenVault vault) {
        switchTo(chain);

        vault = DegenVault(
            payable(
                deployChain(
                    chain,
                    "DegenVault",
                    "DegenVault.sol:DegenVault",
                    ""
                )
            )
        );

        vault.setUsdc(getUsdc(chain));
        vault.setWeth(getWeth(chain));
        dump();
    }
}
