// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {XChainExactOutFixture} from "./helpers/XChainExactOutFixture.sol";

contract UTBExactOutRoutesTestEth2Matic is XChainExactOutFixture {
    function setUp() public {
        src = optimism;
        dst = polygon;
        preSlippage = 2;
        postSlippage = 3;
        initialEthBalance = 1 ether;
        initialUsdcBalance = 100e6;
        MINT_GAS = 1.5e6;

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
        dealTo(src, alice, initialEthBalance);
        mintUsdcTo(src, alice, initialUsdcBalance);
        mintWethTo(src, alice, initialEthBalance);
        setupXChainUTBInfra(src, dst);
        cat = deployTheCat(dst);
        catUsdcPrice = cat.price();
        catEthPrice = cat.ethPrice();
        catPolygonPrice = cat.polygonPrice();
    }

    function testEth2Usdc() public {
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

    function testEth2Weth() public {
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

    function testEth2Matic() public {
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveDecentBridge(
                getXChainCatPolygonMintScenario(address(0), bob)
            );

        assertSourceGasTokenAction(amountIn, preExtraIn, lzFees);
        assertDestinationPolygonMintAndRefund(postExtraIn);
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function testWeth2Matic() public {
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveDecentBridge(
                getXChainCatPolygonMintScenario(getWeth(src), bob)
            );

        assertSourceWethAction(amountIn, preExtraIn, lzFees);
        assertDestinationPolygonMintAndRefund(postExtraIn);
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function testUsdc2Matic() public {
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveDecentBridge(
                getXChainCatPolygonMintScenario(getUsdc(src), bob)
            );
        assertUsdcSourceActionBalances(lzFees, amountIn, preExtraIn);
        assertDestinationPolygonMintAndRefund(postExtraIn);
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }
}
