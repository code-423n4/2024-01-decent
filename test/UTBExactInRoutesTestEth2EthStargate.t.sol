// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {console2} from "forge-std/console2.sol";
import {XChainExactInFixture} from "./helpers/XChainExactInFixture.sol";

contract UTBExactInRoutesTestEth2EthStargate is XChainExactInFixture {
    uint constant APPROX_DEPOSITED = 0.0001 ether;

    function setUp() public {
        src = optimism;
        dst = arbitrum;
        preSlippage = 2;
        postSlippage = 3;
        lowerDepositBps = 690 + STARGATE_FEE_BPS;
        initialEthBalance = 1 ether;
        initialUsdcBalance = 100e6;
        initialWethBalance = 2 ether;
        DEPOSIT_GAS = 9e5;
        usdcIn = 20e6;
        APPROX_BALANCE = 0.001 ether;

        setRuntime(ENV_FORGE_TEST);
        loadAllChainInfo();
        setupUsdcInfo();
        setupWethHelperInfo();
        loadAllUniRouterInfo();
        setSkipFile(true);
        vm.label(alice, "alice");
        vm.label(bob, "bob");
    }

    function xChainDegenBoxSetup() public {
        ethIn = usdc2Eth(src, usdcIn);
        weth2Deposit = shaveOff(ethIn);
        usdc2Deposit = shaveUsdc2UsdcWithUsdcBridge(usdcIn);

        setupXChainUTBInfra(src, dst);
        dealTo(src, alice, initialEthBalance);
        mintWethTo(src, alice, initialWethBalance);
        mintUsdcTo(src, alice, initialUsdcBalance);
        vault = deployTheVault(dst);
    }

    function convertSgBridge(
        address tokenIn,
        address tokenOut,
        uint amountIn
    ) private returns (uint amountOut) {
        (uint amtOut, ) = quoteIn(
            src,
            pathIn(src, tokenIn, getUsdc(src)),
            amountIn
        );
        console2.log("eth pre bridge", amountIn);
        console2.log("usdc pre bridge", amtOut);
        uint bridged = (amtOut * (1000 - STARGATE_FEE_BPS)) / 1000;
        console2.log("usdc post bridge", bridged);
        (amountOut, ) = quoteIn(
            dst,
            pathIn(dst, getUsdc(dst), tokenOut),
            bridged
        );
        console2.log("eth post bridge", amountOut);
    }

    function eth2EthSg(uint amountIn) private returns (uint) {
        return convertSgBridge(getWeth(src), getWeth(dst), amountIn);
    }

    function testExactInEth2Eth() public {
        xChainDegenBoxSetup();
        (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        ) = performXChainExactInAndReceiveStargateBridge(
                getXChainVaultDepositNativeUsdcBridge(address(0), ethIn)
            );
        assertSrcNative(ethIn, lzFees);
        assertDstNative(
            amountOut + postExtraOut + usdc2Eth(dst, preExtraOut),
            APPROX_DEPOSITED
        );
    }

    function testExactInWeth2Eth() public {
        xChainDegenBoxSetup();
        (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        ) = performXChainExactInAndReceiveStargateBridge(
                getXChainVaultDepositNativeUsdcBridge(getWeth(src), ethIn)
            );

        assertSrcWeth(ethIn, lzFees);
        assertDstNative(
            amountOut + postExtraOut + usdc2Eth(dst, preExtraOut),
            APPROX_DEPOSITED
        );
    }

    function testExactInUsdc2Eth() public {
        xChainDegenBoxSetup();
        (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        ) = performXChainExactInAndReceiveStargateBridge(
                getXChainVaultDepositNativeUsdcBridge(getUsdc(src), usdcIn)
            );
        assertSrcUsdc(lzFees, usdcIn);
        assertDstNative(
            amountOut + postExtraOut + usdc2Eth(dst, preExtraOut),
            APPROX_DEPOSITED
        );
    }

    function testExactInEth2WethSuccess() public {
        xChainDegenBoxSetup();
        (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        ) = performXChainExactInAndReceiveStargateBridge(
                getXChainVaultDepositWethUsdcBridge(
                    address(0),
                    ethIn,
                    weth2Deposit
                )
            );
        assertSrcNative(ethIn, lzFees);
        assertDstWethUsdcBridge(
            weth2Deposit,
            amountOut,
            preExtraOut,
            postExtraOut
        );
    }

    function testExactInWeth2Weth() public {
        xChainDegenBoxSetup();
        (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        ) = performXChainExactInAndReceiveStargateBridge(
                getXChainVaultDepositWethUsdcBridge(
                    getWeth(src),
                    ethIn,
                    weth2Deposit
                )
            );
        assertSrcWeth(ethIn, lzFees);
        assertDstWethUsdcBridge(
            weth2Deposit,
            amountOut,
            preExtraOut,
            postExtraOut
        );
    }

    function testExactInUsdc2Weth() public {
        xChainDegenBoxSetup();
        (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        ) = performXChainExactInAndReceiveStargateBridge(
                getXChainVaultDepositWethUsdcBridge(
                    getUsdc(src),
                    usdcIn,
                    weth2Deposit
                )
            );

        assertSrcUsdc(lzFees, usdcIn);
        assertDstWethUsdcBridge(
            weth2Deposit,
            amountOut,
            preExtraOut,
            postExtraOut
        );
    }

    function testExactInEth2Usdc() public {
        xChainDegenBoxSetup();
        (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        ) = performXChainExactInAndReceiveStargateBridge(
                getXChainVaultDepositUsdcUsdcBridge(
                    address(0),
                    ethIn,
                    usdc2Deposit
                )
            );
        assertSrcNative(ethIn, lzFees);
        assertDstUsdcWithUsdcBridge(
            usdc2Deposit,
            preExtraOut,
            postExtraOut,
            amountOut
        );
    }

    function testExactInWeth2Usdc() public {
        xChainDegenBoxSetup();
        (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        ) = performXChainExactInAndReceiveStargateBridge(
                getXChainVaultDepositUsdcUsdcBridge(
                    getWeth(src),
                    ethIn,
                    usdc2Deposit
                )
            );

        assertSrcWeth(ethIn, lzFees);
        assertDstUsdcWithUsdcBridge(
            usdc2Deposit,
            preExtraOut,
            postExtraOut,
            amountOut
        );
    }

    function testExactInUsdc2Usdc() public {
        xChainDegenBoxSetup();
        (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        ) = performXChainExactInAndReceiveStargateBridge(
                getXChainVaultDepositUsdcUsdcBridge(
                    getUsdc(src),
                    usdcIn,
                    usdc2Deposit
                )
            );

        assertSrcUsdc(lzFees, usdcIn);
        assertDstUsdcWithUsdcBridge(
            usdc2Deposit,
            preExtraOut,
            postExtraOut,
            amountOut
        );
    }

    function testExactInEth2WethDepositTooMuch() public {
        xChainDegenBoxSetup();
        (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        ) = performXChainExactInAndReceiveStargateBridge(
                getXChainVaultDepositWethUsdcBridge(
                    address(0),
                    ethIn,
                    weth2Deposit * 2
                )
            );
        assertSrcNative(ethIn, lzFees);

        switchTo(dst);
        assertEq(alice.balance, 0);
        assertEq(wethBalance(dst, address(vault)), 0);
        assertApproxEqRel(
            wethBalance(dst, alice),
            usdc2Eth(dst, preExtraOut) +
                postExtraOut +
                amountOut -
                ((usdc2Eth(dst, preExtraOut) * STARGATE_FEE_BPS) / 10000),
            APPROX_BALANCE
        );
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function testExactInEth2WethCallWithEthAndFail() public {
        xChainDegenBoxSetup();
        (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        ) = performXChainExactInAndReceiveStargateBridge(
                getXChainVaultCallFailingFunctionUsdcBridge(address(0), ethIn)
            );
        assertSrcNative(ethIn, lzFees);

        switchTo(dst);
        assertApproxEqRel(
            alice.balance,
            usdc2Eth(dst, preExtraOut) +
                postExtraOut +
                amountOut -
                ((usdc2Eth(dst, preExtraOut) * STARGATE_FEE_BPS) / 10000),
            0.00001 ether
        );
        assertEq(wethBalance(dst, address(vault)), 0);
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }
}
