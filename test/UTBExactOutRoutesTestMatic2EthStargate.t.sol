// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {console2} from "forge-std/console2.sol";
import {XChainExactOutFixture} from "./helpers/XChainExactOutFixture.sol";

contract UTBExactOutRoutesTestMatic2EthStargate is XChainExactOutFixture {
    function setUp() public {
        src = polygon;
        dst = arbitrum;
        preSlippage = 2;
        postSlippage = 3;
        initialEthBalance = 1 ether;
        initialNativeChainBalance = 1000 ether; // 100 matic
        initialUsdcBalance = 100e6; // 100 usd
        MINT_GAS = 1e6;
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
        dealTo(src, alice, initialNativeChainBalance);
        mintUsdcTo(src, alice, initialUsdcBalance);
        mintWethTo(src, alice, initialEthBalance);
        mintWrappedTo(src, alice, initialNativeChainBalance);
        setupXChainUTBInfra(src, dst);
        cat = deployTheCat(dst);
        catUsdcPrice = cat.price();
        catEthPrice = cat.ethPrice();
    }

    function testMatic2Eth() public {
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

    function testMatic2Usdc() public {
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

    function testMatic2Weth() public {
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
}
