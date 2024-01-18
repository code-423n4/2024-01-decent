// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {DegenVault} from "./DegenVault.sol";
import {LoadAllChainInfo} from "forge-toolkit/LoadAllChainInfo.sol";
import {AliceAndBobScenario} from "../swappers/UniSwapper.t.sol";
import {UTBCommonAssertions} from "./UTBCommonAssertions.sol";
import {XChainSwap} from "./XChainDecentBridgeActions.sol";
import {console2} from "forge-std/console2.sol";

contract XChainExactInFixture is
    Test,
    AliceAndBobScenario,
    UTBCommonAssertions
{
    DegenVault vault;
    uint lowerDepositBps;
    uint64 DEPOSIT_GAS;
    uint usdcIn;
    uint ethIn;
    uint avaxIn;
    uint maticIn;
    uint weth2Deposit;
    uint usdc2Deposit;

    function usdc2Native(
        string memory chain,
        uint amount
    ) public returns (uint256) {
        (uint amt, ) = quoteIn(
            chain,
            pathIn(chain, getUsdc(chain), getWrapped(chain)),
            amount
        );
        return amt;
    }

    function usdc2Eth(
        string memory chain,
        uint amount
    ) public returns (uint256) {
        (uint amt, ) = quoteIn(
            chain,
            pathIn(chain, getUsdc(chain), getWeth(chain)),
            amount
        );
        return amt;
    }

    function eth2Usdc(
        string memory chain,
        uint amount
    ) public returns (uint256) {
        (uint amt, ) = quoteIn(
            chain,
            pathIn(chain, getWeth(chain), getUsdc(chain)),
            amount
        );
        return amt;
    }

    function eth2Matic(uint amount) public returns (uint256) {
        switchTo(polygon);
        (uint amt, ) = quoteIn(
            polygon,
            pathIn(polygon, getWeth(polygon), getWrapped(polygon)),
            amount
        );
        return amt;
    }

    function shaveUsdc2Usdc(uint _usdcIn) public returns (uint usdcOut) {
        return shaveToken2Token(getUsdc(src), _usdcIn, getUsdc(dst));
    }

    function shaveUsdc2UsdcWithUsdcBridge(
        uint amountIn
    ) public returns (uint amountOut) {
        return
            shaveToken2Token(
                getUsdc(src),
                amountIn,
                getUsdc(dst),
                getUsdc(src),
                getUsdc(dst)
            );
    }

    function shaveToken2Token(
        address tokenIn,
        uint amountIn,
        address tokenOut
    ) public returns (uint amountOut) {
        return
            shaveToken2Token(
                tokenIn,
                amountIn,
                tokenOut,
                getWeth(src),
                getWeth(dst)
            );
    }

    function shaveToken2Token(
        address tokenIn,
        uint amountIn,
        address tokenOut,
        address bridgeIn,
        address bridgeOut
    ) public returns (uint amountOut) {
        (uint amtOut, ) = quoteIn(
            src,
            pathIn(src, tokenIn, bridgeIn),
            amountIn
        );
        uint bridged = (amtOut * (100 - preSlippage)) / 100;
        (uint dstOut, ) = quoteIn(
            dst,
            pathIn(dst, bridgeOut, tokenOut),
            bridged
        );
        uint postSlip = (dstOut * (100 - postSlippage)) / 100;
        amountOut = (postSlip * (1e4 - lowerDepositBps)) / 1e4;
    }

    function shaveOff(uint amount) public view returns (uint) {
        return
            (((((amount * (100 - preSlippage)) / 100) * (100 - postSlippage)) /
                100) * (1e4 - lowerDepositBps)) / 1e4;
    }

    function getXChainVaultDepositNativeUsdcBridge(
        address tokenIn,
        uint deposit
    ) public view returns (XChainSwap memory xChainSwap) {
        return
            getXChainVaultDepositScenario(
                tokenIn,
                address(0),
                getUsdc(src),
                getUsdc(dst),
                STARGATE_FEE_BPS,
                deposit,
                abi.encodeCall(vault.depositNative, ())
            );
    }

    function getXChainVaultDepositWethUsdcBridge(
        address tokenIn,
        uint deposit,
        uint _weth2Deposit
    ) public view returns (XChainSwap memory xChainSwap) {
        return
            getXChainVaultDepositScenario(
                tokenIn,
                getWeth(dst),
                getUsdc(src),
                getUsdc(dst),
                STARGATE_FEE_BPS,
                deposit,
                abi.encodeCall(vault.depositWeth, (_weth2Deposit))
            );
    }

    function getXChainVaultDepositUsdcUsdcBridge(
        address tokenIn,
        uint deposit,
        uint _usdc2Deposit
    ) public view returns (XChainSwap memory xChainSwap) {
        return
            getXChainVaultDepositScenario(
                tokenIn,
                getUsdc(dst),
                getUsdc(src),
                getUsdc(dst),
                STARGATE_FEE_BPS,
                deposit,
                abi.encodeCall(vault.depositUsdc, (_usdc2Deposit))
            );
    }

    function getXChainVaultDepositNative(
        address tokenIn,
        uint deposit
    ) public view returns (XChainSwap memory xChainSwap) {
        return
            getXChainVaultDepositScenario(
                tokenIn,
                address(0),
                deposit,
                abi.encodeCall(vault.depositNative, ())
            );
    }

    function getXChainVaultCallFailingFunctionUsdcBridge(
        address tokenIn,
        uint deposit
    ) public view returns (XChainSwap memory xChainSwap) {
        return
            getXChainVaultDepositScenario(
                tokenIn,
                address(0),
                getUsdc(src),
                getUsdc(dst),
                STARGATE_FEE_BPS,
                deposit,
                abi.encodeCall(vault.depositAndFail, ())
            );
    }

    function getXChainVaultCallFailingFunction(
        address tokenIn,
        uint deposit
    ) public view returns (XChainSwap memory xChainSwap) {
        return
            getXChainVaultDepositScenario(
                tokenIn,
                address(0),
                deposit,
                abi.encodeCall(vault.depositAndFail, ())
            );
    }

    function getXChainVaultDepositWeth(
        address tokenIn,
        uint deposit,
        uint _weth2Deposit
    ) public view returns (XChainSwap memory xChainSwap) {
        return
            getXChainVaultDepositScenario(
                tokenIn,
                getWeth(dst),
                deposit,
                abi.encodeCall(vault.depositWeth, (_weth2Deposit))
            );
    }

    function getXChainVaultDepositUsdc(
        address tokenIn,
        uint deposit,
        uint _usdc2Deposit
    ) public view returns (XChainSwap memory xChainSwap) {
        return
            getXChainVaultDepositScenario(
                tokenIn,
                getUsdc(dst),
                deposit,
                abi.encodeCall(vault.depositUsdc, (_usdc2Deposit))
            );
    }

    function getXChainVaultDepositScenario(
        address tokenIn,
        address tokenOut,
        uint deposit,
        bytes memory callPayload
    ) public view returns (XChainSwap memory xChainSwap) {
        return
            getXChainVaultDepositScenario(
                tokenIn,
                tokenOut,
                gasEthLookup[src] ? address(0) : getWeth(src),
                getWeth(dst),
                0,
                deposit,
                callPayload
            );
    }

    function getXChainVaultDepositScenario(
        address tokenIn,
        address tokenOut,
        address srcBridgeToken,
        address dstBridgeToken,
        uint bridgeFeeBps,
        uint deposit,
        bytes memory callPayload
    ) public view returns (XChainSwap memory xChainSwap) {
        xChainSwap = XChainSwap({
            src: src,
            dst: dst,
            tokenIn: tokenIn,
            srcBridgeToken: srcBridgeToken,
            dstBridgeToken: dstBridgeToken,
            amountIn: deposit,
            tokenOut: tokenOut,
            amountOut: 0, // will get quoted
            preSlippage: preSlippage,
            postSlippage: postSlippage,
            bridgeFeeBps: bridgeFeeBps,
            refund: payable(alice),
            from: alice,
            target: address(vault),
            paymentOperator: address(vault),
            gas: DEPOSIT_GAS,
            callPayload: callPayload
        });
    }

    function assertNativeBalance(uint lzFees) public {
        assertNativeBalance(lzFees, 0);
    }

    function assertNativeBalance(uint lzFees, uint amountIn) public {
        assertApproxEqRel(
            alice.balance,
            (
                gasEthLookup[src]
                    ? initialEthBalance
                    : initialNativeChainBalance
            ) -
                lzFees -
                amountIn,
            APPROX_BALANCE
        );
    }

    function assertSrcNative(uint256 amountIn, uint256 lzFees) public {
        switchTo(src);
        assertNativeBalance(lzFees, amountIn);
        assertEq(wethBalance(src, alice), initialWethBalance);
    }

    function assertSrcWeth(uint256 amountIn, uint256 lzFees) public {
        switchTo(src);
        assertNativeBalance(lzFees);
        assertEq(wethBalance(src, alice), initialWethBalance - amountIn);
    }

    function assertSrcUsdc(uint256 lzFees, uint256 _usdcIn) public {
        switchTo(src);
        assertNativeBalance(lzFees);
        assertEq(wethBalance(src, alice), initialWethBalance);
        assertEq(usdcBalance(src, alice), initialUsdcBalance - _usdcIn);
    }

    function assertDstUsdcWithUsdcBridge(
        uint _usdc2Deposit,
        uint preExtraOut,
        uint postExtraUsdcOut,
        uint amountOut
    ) public {
        switchTo(dst);
        assertEq(alice.balance, 0);
        assertEq(usdcBalance(dst, address(vault)), _usdc2Deposit);
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
        switchTo(dst);
        assertApproxEqRel(
            usdcBalance(dst, alice),
            preExtraOut +
                postExtraUsdcOut +
                amountOut -
                _usdc2Deposit -
                ((preExtraOut * STARGATE_FEE_BPS) / 10000),
            APPROX_BALANCE
        );
    }

    function assertDstUsdc(
        uint _usdc2Deposit,
        uint preExtraOut,
        uint postExtraUsdcOut,
        uint amountOut
    ) public {
        switchTo(dst);
        assertEq(alice.balance, 0);
        assertEq(usdcBalance(dst, address(vault)), _usdc2Deposit);
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
        switchTo(dst);
        assertApproxEqRel(
            usdcBalance(dst, alice),
            eth2Usdc(dst, preExtraOut) +
                postExtraUsdcOut +
                amountOut -
                _usdc2Deposit,
            0.001 ether
        );
    }

    function assertDstNative(uint256 amountIn) public {
        assertDstNative(amountIn, 0);
    }

    function assertDstNative(uint256 amountIn, uint bps) public {
        switchTo(dst);
        assertEq(alice.balance, 0);
        assertApproxEqRel(address(vault).balance, amountIn, bps);
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function assertDstWethUsdcBridge(
        uint _weth2Deposit,
        uint amountOut,
        uint preExtraOut,
        uint postExtraOut
    ) public {
        switchTo(dst);
        assertEq(alice.balance, 0);
        assertEq(wethBalance(dst, address(vault)), _weth2Deposit);
        assertApproxEqRel(
            wethBalance(dst, alice),
            usdc2Eth(dst, preExtraOut) +
                postExtraOut +
                amountOut -
                _weth2Deposit,
            APPROX_BALANCE
        );
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function assertDstWeth(
        uint _weth2Deposit,
        uint amountOut,
        uint preExtraOut,
        uint postExtraOut
    ) public {
        switchTo(dst);
        assertEq(alice.balance, 0);
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
        switchTo(dst);
        assertEq(wethBalance(dst, address(vault)), _weth2Deposit);
        assertEq(
            wethBalance(dst, alice),
            preExtraOut + postExtraOut + amountOut - _weth2Deposit
        );
    }
}
