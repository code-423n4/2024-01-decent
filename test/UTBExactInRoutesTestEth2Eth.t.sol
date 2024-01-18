// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {XChainExactInFixture} from "./helpers/XChainExactInFixture.sol";

contract UTBExactInRoutesTestEth2Eth is XChainExactInFixture {
    function setUp() public {
        src = optimism;
        dst = arbitrum;
        preSlippage = 2;
        postSlippage = 3;
        lowerDepositBps = 690;
        initialEthBalance = 1 ether;
        initialUsdcBalance = 100e6;
        initialWethBalance = 2 ether;
        DEPOSIT_GAS = 9e5;
        usdcIn = 20e6;

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
        usdc2Deposit = shaveOff(usdcIn);

        setupXChainUTBInfra(src, dst);
        dealTo(src, alice, initialEthBalance);
        mintWethTo(src, alice, initialWethBalance);
        mintUsdcTo(src, alice, initialUsdcBalance);
        vault = deployTheVault(dst);
    }

    function testExactInEth2Eth() public {
        xChainDegenBoxSetup();
        (
            /*uint256 preExtraOut*/,
            /*uint256 postExtraOut*/,
            uint256 lzFees,
            /*uint256 amountOut*/
        ) = performXChainExactInAndReceiveDecentBridge(
                getXChainVaultDepositNative(address(0), ethIn)
            );
        assertSrcNative(ethIn, lzFees);
        assertDstNative(ethIn);
    }

    function testExactInWeth2Eth() public {
        xChainDegenBoxSetup();
        (
            /*uint256 preExtraOut*/,
            /*uint256 postExtraOut*/,
            uint256 lzFees,
            /*uint256 amountOut*/
        ) = performXChainExactInAndReceiveDecentBridge(
                getXChainVaultDepositNative(getWeth(src), ethIn)
            );

        assertSrcWeth(ethIn, lzFees);
        assertDstNative(ethIn);
    }

    function testExactInUsdc2Eth() public {
        xChainDegenBoxSetup();
        (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        ) = performXChainExactInAndReceiveDecentBridge(
                getXChainVaultDepositNative(getUsdc(src), usdcIn)
            );
        assertSrcUsdc(lzFees, usdcIn);
        assertDstNative(amountOut + preExtraOut + postExtraOut);
    }

    function testExactInEth2Weth() public {
        xChainDegenBoxSetup();
        (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        ) = performXChainExactInAndReceiveDecentBridge(
                getXChainVaultDepositWeth(address(0), ethIn, weth2Deposit)
            );
        assertSrcNative(ethIn, lzFees);
        assertDstWeth(weth2Deposit, amountOut, preExtraOut, postExtraOut);
    }

    function testExactInWeth2Weth() public {
        xChainDegenBoxSetup();
        (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        ) = performXChainExactInAndReceiveDecentBridge(
                getXChainVaultDepositWeth(getWeth(src), ethIn, weth2Deposit)
            );
        assertSrcWeth(ethIn, lzFees);
        assertDstWeth(weth2Deposit, amountOut, preExtraOut, postExtraOut);
    }

    function testExactInUsdc2Weth() public {
        xChainDegenBoxSetup();
        (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        ) = performXChainExactInAndReceiveDecentBridge(
                getXChainVaultDepositWeth(getUsdc(src), usdcIn, weth2Deposit)
            );

        assertSrcUsdc(lzFees, usdcIn);
        assertDstWeth(weth2Deposit, amountOut, preExtraOut, postExtraOut);
    }

    function testExactInEth2Usdc() public {
        xChainDegenBoxSetup();
        (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        ) = performXChainExactInAndReceiveDecentBridge(
                getXChainVaultDepositUsdc(address(0), ethIn, usdc2Deposit)
            );
        assertSrcNative(ethIn, lzFees);
        assertDstUsdc(usdc2Deposit, preExtraOut, postExtraOut, amountOut);
    }

    function testExactInWeth2Usdc() public {
        xChainDegenBoxSetup();
        (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        ) = performXChainExactInAndReceiveDecentBridge(
                getXChainVaultDepositUsdc(getWeth(src), ethIn, usdc2Deposit)
            );

        assertSrcWeth(ethIn, lzFees);
        assertDstUsdc(usdc2Deposit, preExtraOut, postExtraOut, amountOut);
    }

    function testExactInUsdc2Usdc() public {
        xChainDegenBoxSetup();
        (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        ) = performXChainExactInAndReceiveDecentBridge(
                getXChainVaultDepositUsdc(getUsdc(src), usdcIn, usdc2Deposit)
            );

        assertSrcUsdc(lzFees, usdcIn);
        assertDstUsdc(usdc2Deposit, preExtraOut, postExtraOut, amountOut);
    }

    function testExactInEth2WethDepositTooMuch() public {
        xChainDegenBoxSetup();
        (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        ) = performXChainExactInAndReceiveDecentBridge(
                getXChainVaultDepositWeth(address(0), ethIn, weth2Deposit * 2)
            );
        assertSrcNative(ethIn, lzFees);

        switchTo(dst);
        assertEq(alice.balance, 0);
        assertEq(wethBalance(dst, address(vault)), 0);
        assertEq(
            wethBalance(dst, alice),
            preExtraOut + postExtraOut + amountOut
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
        ) = performXChainExactInAndReceiveDecentBridge(
                getXChainVaultCallFailingFunction(address(0), ethIn)
            );
        assertSrcNative(ethIn, lzFees);

        switchTo(dst);
        assertEq(alice.balance, preExtraOut + postExtraOut + amountOut);
        assertEq(wethBalance(dst, address(vault)), 0);
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }
}
