// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {XChainExactOutFixture} from "./helpers/XChainExactOutFixture.sol";

contract UTBExactOutRoutesTestEth2EthStargate is XChainExactOutFixture {
    function setUp() public {
        src = optimism;
        dst = arbitrum;
        preSlippage = 2;
        postSlippage = 3;
        initialEthBalance = 1 ether;
        initialUsdcBalance = 10e6;
        MINT_GAS = 9e5;
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

    function xChainCatMintSetup() public {
        dealTo(src, alice, initialEthBalance);
        mintUsdcTo(src, alice, initialUsdcBalance);
        mintWethTo(src, alice, initialEthBalance);
        setupXChainUTBInfra(src, dst);
        cat = deployTheCat(dst);
        catUsdcPrice = cat.price();
        catEthPrice = cat.ethPrice();
    }

    function testEth2Eth() public {
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveStargateBridge(
                getXChainCatEthMintScenarioUsdcBridgeToken(address(0), bob)
            );
        assertSourceGasTokenAction(amountIn, preExtraIn, lzFees);
        assertDestinationMintAndRefund(postExtraIn, getUsdc(dst));
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function testWeth2Eth() public {
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveStargateBridge(
                getXChainCatEthMintScenarioUsdcBridgeToken(getWeth(src), bob)
            );
        assertSourceWethAction(amountIn, preExtraIn, lzFees);
        assertDestinationMintAndRefund(postExtraIn, getUsdc(dst));
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function testUsdc2Eth() public {
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveStargateBridge(
                getXChainCatEthMintScenarioUsdcBridgeToken(getUsdc(src), bob)
            );

        assertUsdcSourceActionBalances(lzFees, amountIn, preExtraIn);
        assertDestinationMintAndRefund(postExtraIn, getUsdc(dst));
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function testEth2Usdc() public {
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveStargateBridge(
                getXChainCatUSDCMintScenarioUsdcBridgeToken(address(0), bob)
            );

        assertSourceGasTokenAction(amountIn, preExtraIn, lzFees);
        assertDestinationMintAndRefund(postExtraIn, getUsdc(dst));
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function testWeth2Usdc() public {
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveStargateBridge(
                getXChainCatUSDCMintScenarioUsdcBridgeToken(getWeth(src), bob)
            );

        assertSourceWethAction(amountIn, preExtraIn, lzFees);
        assertDestinationMintAndRefund(postExtraIn, getUsdc(dst));
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function testUsdc2Usdc() public {
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveStargateBridge(
                getXChainCatUSDCMintScenarioUsdcBridgeToken(getUsdc(src), bob)
            );

        assertUsdcSourceActionBalances(lzFees, amountIn, preExtraIn);
        assertDestinationMintAndRefund(postExtraIn, getUsdc(dst));
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function testEth2Weth() public {
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveStargateBridge(
                getXChainCatWethMintScenarioUsdcBridgeToken(address(0), bob)
            );

        assertSourceGasTokenAction(amountIn, preExtraIn, lzFees);
        assertDestinationMintAndRefund(postExtraIn, getUsdc(dst));
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function testUsdc2Weth() public {
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveStargateBridge(
                getXChainCatWethMintScenarioUsdcBridgeToken(getUsdc(src), bob)
            );

        assertUsdcSourceActionBalances(lzFees, amountIn, preExtraIn);
        assertDestinationMintAndRefund(postExtraIn, getUsdc(dst));
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }
}
