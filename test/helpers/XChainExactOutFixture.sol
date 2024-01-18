// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {VeryCoolCat} from "./VeryCoolCat.sol";
import {Test} from "forge-std/Test.sol";
import {LoadAllChainInfo} from "forge-toolkit/LoadAllChainInfo.sol";
import {AliceAndBobScenario} from "../swappers/UniSwapper.t.sol";
import {UTBCommonAssertions} from "./UTBCommonAssertions.sol";
import {XChainSwap} from "./XChainDecentBridgeActions.sol";
import {console2} from "forge-std/console2.sol";
import {ERC20} from "solmate/tokens/ERC20.sol";

contract XChainExactOutFixture is
    Test,
    AliceAndBobScenario,
    UTBCommonAssertions
{
    VeryCoolCat cat;
    uint catUsdcPrice;
    uint catPolygonPrice;
    uint catEthPrice;
    uint64 MINT_GAS;

    function getXChainCatMintScenario(
        address tokenIn,
        address tokenOut,
        uint price,
        address mintTo,
        bytes memory callPayload
    ) public view returns (XChainSwap memory xChainSwap) {
        return
            getXChainCatMintScenario(
                tokenIn,
                tokenOut,
                gasEthLookup[src] ? address(0) : getWeth(src),
                getWeth(dst),
                0,
                price,
                mintTo,
                callPayload
            );
    }

    function getXChainCatMintScenario(
        address tokenIn,
        address tokenOut,
        address srcBridgeToken,
        address dstBridgeToken,
        uint256 bridgeFeeBps,
        uint price,
        address /*mintTo*/,
        bytes memory callPayload
    ) public view returns (XChainSwap memory xChainSwap) {
        xChainSwap = XChainSwap({
            src: src,
            dst: dst,
            tokenIn: tokenIn,
            amountIn: 0, // will be quoted
            tokenOut: tokenOut,
            srcBridgeToken: srcBridgeToken,
            dstBridgeToken: dstBridgeToken,
            bridgeFeeBps: bridgeFeeBps,
            amountOut: price,
            preSlippage: preSlippage,
            postSlippage: postSlippage,
            refund: payable(alice),
            from: alice,
            target: address(cat),
            paymentOperator: address(cat),
            gas: MINT_GAS,
            callPayload: callPayload
        });
    }

    function getXChainCatWethMintScenario(
        address tokenIn,
        address mintTo,
        address srcBridgeToken,
        address dstBridgeToken,
        uint256 bridgeFeeBps
    ) public view returns (XChainSwap memory xChainSwap) {
        return
            getXChainCatMintScenario(
                tokenIn,
                getWeth(dst),
                srcBridgeToken,
                dstBridgeToken,
                bridgeFeeBps,
                catEthPrice,
                mintTo,
                abi.encodeCall(cat.mintWithWeth, (mintTo))
            );
    }

    function getXChainCatWethMintScenario(
        address tokenIn,
        address mintTo
    ) public view returns (XChainSwap memory xChainSwap) {
        return
            getXChainCatMintScenario(
                tokenIn,
                getWeth(dst),
                catEthPrice,
                mintTo,
                abi.encodeCall(cat.mintWithWeth, (mintTo))
            );
    }

    function getXChainCatPolygonMintScenario(
        address tokenIn,
        address mintTo
    ) public view returns (XChainSwap memory xChainSwap) {
        return
            getXChainCatMintScenario(
                tokenIn,
                address(0),
                catPolygonPrice,
                mintTo,
                abi.encodeCall(cat.mintWithPolygon, (mintTo))
            );
    }

    function getXChainCatPolygonMintScenarioUsdcBridgeToken(
        address tokenIn,
        address mintTo
    ) public view returns (XChainSwap memory xChainSwap) {
        return
            getXChainCatMintScenario(
                tokenIn,
                address(0),
                getUsdc(src),
                getUsdc(dst),
                STARGATE_FEE_BPS,
                catPolygonPrice,
                mintTo,
                abi.encodeCall(cat.mintWithPolygon, (mintTo))
            );
    }

    function getXChainCatEthMintScenarioUsdcBridgeToken(
        address tokenIn,
        address mintTo
    ) public view returns (XChainSwap memory xChainSwap) {
        return
            getXChainCatMintScenario(
                tokenIn,
                address(0),
                getUsdc(src),
                getUsdc(dst),
                STARGATE_FEE_BPS,
                catEthPrice,
                mintTo,
                abi.encodeCall(cat.mintWithEth, (mintTo))
            );
    }

    function getXChainCatUSDCMintScenarioUsdcBridgeToken(
        address tokenIn,
        address mintTo
    ) public view returns (XChainSwap memory xChainSwap) {
        return
            getXChainCatMintScenario(
                tokenIn,
                getUsdc(dst),
                getUsdc(src),
                getUsdc(dst),
                STARGATE_FEE_BPS,
                catUsdcPrice,
                mintTo,
                abi.encodeCall(cat.mintWithUsdc, (mintTo))
            );
    }

    function getXChainCatWethMintScenarioUsdcBridgeToken(
        address tokenIn,
        address mintTo
    ) public view returns (XChainSwap memory xChainSwap) {
        return
            getXChainCatMintScenario(
                tokenIn,
                getWeth(dst),
                getUsdc(src),
                getUsdc(dst),
                STARGATE_FEE_BPS,
                catEthPrice,
                mintTo,
                abi.encodeCall(cat.mintWithWeth, (mintTo))
            );
    }

    function getXChainCatEthMintScenario(
        address tokenIn,
        address mintTo
    ) public view returns (XChainSwap memory xChainSwap) {
        return
            getXChainCatMintScenario(
                tokenIn,
                address(0),
                catEthPrice,
                mintTo,
                abi.encodeCall(cat.mintWithEth, (mintTo))
            );
    }

    function getXChainCatUSDCMintScenario(
        address tokenIn,
        address mintTo
    ) public view returns (XChainSwap memory xChainSwap) {
        return
            getXChainCatMintScenario(
                tokenIn,
                getUsdc(dst),
                catUsdcPrice,
                mintTo,
                abi.encodeCall(cat.mintWithUsdc, (mintTo))
            );
    }

    function assertSourceGasTokenAction(
        uint256 amountIn,
        uint256 preExtraIn,
        uint256 lzFees
    ) public {
        switchTo(src);
        uint initialNative = gasEthLookup[src]
            ? initialEthBalance
            : initialNativeChainBalance;
        assertEq(wrappedBalance(src, alice), initialNative + preExtraIn);

        uint finalBalance = initialNative - (lzFees + amountIn);
        if (feeToken == address(0)) {
            finalBalance -= feeAmount;
        }

        assertApproxEqRel(alice.balance, finalBalance, APPROX_BALANCE);
    }

    function assertDestinationPolygonMintAndRefund(uint postExtraIn) public {
        assertDestinationPolygonMintAndRefund(postExtraIn, getWeth(dst));
    }

    function assertDestinationPolygonMintAndRefund(
        uint postExtraIn,
        address bridgeToken
    ) public {
        assertDestinationMintAndRefund(postExtraIn, bridgeToken);
        assertEq(address(cat).balance, catPolygonPrice);
    }

    function assertDestinationMintAndRefund(
        uint postExtraIn,
        address bridgeToken
    ) public {
        switchTo(dst);
        assertEq(cat.balanceOf(bob), 1);
        assertApproxEqRel(
            ERC20(bridgeToken).balanceOf(alice),
            postExtraIn,
            APPROX_BALANCE
        );
    }

    function assertDestinationMintAndRefund(uint postExtraIn) public {
        assertDestinationMintAndRefund(postExtraIn, getWeth(dst));
    }

    function assertSourceWethAction(
        uint256 amountIn,
        uint256 preExtraIn,
        uint256 lzFees
    ) public {
        switchTo(src);
        assertEq(
            wethBalance(src, alice),
            initialEthBalance - amountIn + preExtraIn
        );

        uint initialNativeBalance = gasEthLookup[src]
            ? initialEthBalance
            : initialNativeChainBalance;
        assertApproxEqRel(
            alice.balance,
            initialNativeBalance - (lzFees),
            APPROX_BALANCE
        );
    }

    function assertSourceWrappedAction(
        uint256 amountIn,
        uint256 preExtraIn,
        uint256 lzFees
    ) public {
        switchTo(src);
        assertEq(
            wrappedBalance(src, alice),
            initialNativeChainBalance - amountIn + preExtraIn
        );

        uint initialNativeBalance = gasEthLookup[src]
            ? initialEthBalance
            : initialNativeChainBalance;

        assertApproxEqRel(
            alice.balance,
            initialNativeBalance - (lzFees),
            APPROX_BALANCE
        );
    }

    function assertUsdcSourceActionBalances(
        uint lzFees,
        uint amountIn,
        uint preExtraIn
    ) public {
        switchTo(src);
        uint finalNativeBalance = gasEthLookup[src]
            ? initialEthBalance
            : initialNativeChainBalance;
        finalNativeBalance -= lzFees;

        if (feeToken == address(0)) {
            finalNativeBalance -= feeAmount;
        }

        uint finalUsdcBalance = initialUsdcBalance - amountIn + preExtraIn;
        if (feeToken == getUsdc(src)) {
            finalUsdcBalance -= feeAmount;
        }

        assertApproxEqRel(alice.balance, finalNativeBalance, APPROX_BALANCE);

        assertEq(usdcBalance(src, alice), finalUsdcBalance);
    }
}
