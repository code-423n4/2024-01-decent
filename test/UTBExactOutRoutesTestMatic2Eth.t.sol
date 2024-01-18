// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {console2} from "forge-std/console2.sol";
import {XChainExactOutFixture} from "./helpers/XChainExactOutFixture.sol";

contract UTBExactOutRoutesTestMatic2Eth is XChainExactOutFixture {
    function setUp() public {
        src = polygon;
        dst = arbitrum;
        preSlippage = 2;
        postSlippage = 3;
        initialEthBalance = 1 ether;
        initialNativeChainBalance = 100 ether; // 100 matic
        initialUsdcBalance = 100e6; // 100 usd
        MINT_GAS = 1e6;

        setRuntime(ENV_FORGE_TEST);
        loadAllChainInfo();
        setupUsdcInfo();
        setupWethHelperInfo();
        loadAllUniRouterInfo();
        setSkipFile(true);
        vm.label(alice, "alice");
        vm.label(bob, "bob");
    }

    function xChainCatMintSetup() public {
        dealTo(src, alice, initialNativeChainBalance);
        mintUsdcTo(src, alice, initialUsdcBalance);
        mintWethTo(src, alice, initialEthBalance);
        mintWrappedTo(src, alice, initialNativeChainBalance);
        setupXChainUTBInfra(src, dst);
        cat = deployTheCat(dst);
        catUsdcPrice = cat.price();
        catEthPrice = cat.ethPrice();
    }

    function testMatic2Usdc() public {
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveDecentBridge(
                getXChainCatUSDCMintScenario(address(0), bob)
            );

        assertSourceGasTokenAction(amountIn, preExtraIn, lzFees);
        assertDestinationMintAndRefund(postExtraIn);
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function testMatic2Weth() public {
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveDecentBridge(
                getXChainCatWethMintScenario(address(0), bob)
            );

        assertSourceGasTokenAction(amountIn, preExtraIn, lzFees);
        assertDestinationMintAndRefund(postExtraIn);
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function testMatic2Eth() public {
        xChainCatMintSetup();

        switchTo(src);

        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveDecentBridge(
                getXChainCatEthMintScenario(address(0), bob)
            );

        switchTo(src);

        assertSourceGasTokenAction(amountIn, preExtraIn, lzFees);
        assertDestinationMintAndRefund(postExtraIn);
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function testWeth2Usdc() public {
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveDecentBridge(
                getXChainCatUSDCMintScenario(getWeth(src), bob)
            );

        assertSourceWethAction(amountIn, preExtraIn, lzFees);
        assertDestinationMintAndRefund(postExtraIn);
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function testWeth2Weth() public {
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveDecentBridge(
                getXChainCatWethMintScenario(getWeth(src), bob)
            );

        assertSourceWethAction(amountIn, preExtraIn, lzFees);
        assertDestinationMintAndRefund(postExtraIn);
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function testWeth2Eth() public {
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveDecentBridge(
                getXChainCatEthMintScenario(getWeth(src), bob)
            );

        assertSourceWethAction(amountIn, preExtraIn, lzFees);
        assertDestinationMintAndRefund(postExtraIn);
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function testUsdc2Usdc() public {
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveDecentBridge(
                getXChainCatUSDCMintScenario(getUsdc(src), bob)
            );

        assertUsdcSourceActionBalances(lzFees, amountIn, preExtraIn);
        assertDestinationMintAndRefund(postExtraIn);
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function testUsdc2Weth() public {
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveDecentBridge(
                getXChainCatWethMintScenario(getUsdc(src), bob)
            );

        assertUsdcSourceActionBalances(lzFees, amountIn, preExtraIn);
        assertDestinationMintAndRefund(postExtraIn);
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function testUsdc2Eth() public {
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveDecentBridge(
                getXChainCatEthMintScenario(getUsdc(src), bob)
            );

        assertUsdcSourceActionBalances(lzFees, amountIn, preExtraIn);
        assertDestinationMintAndRefund(postExtraIn);
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }
}
