// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {console2} from "forge-std/console2.sol";
import {XChainExactOutFixture} from "./helpers/XChainExactOutFixture.sol";

contract UTBExactOutRoutesTestAvax2MaticStargate is XChainExactOutFixture {
    function setUp() public {
        src = avalanche;
        dst = polygon;
        preSlippage = 2;
        postSlippage = 3;
        initialEthBalance = 1 ether;
        initialNativeChainBalance = 100 ether; // 100 avax
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
        mintWrappedTo(src, alice, initialNativeChainBalance);
        mintUsdcTo(src, alice, initialUsdcBalance);
        mintWethTo(src, alice, initialEthBalance);
        setupXChainUTBInfra(src, dst);
        cat = deployTheCat(dst);
        catUsdcPrice = cat.price();
        catEthPrice = cat.ethPrice();
        catPolygonPrice = cat.polygonPrice();
    }

    function testAvax2Matic() public {
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveStargateBridge(
                getXChainCatPolygonMintScenarioUsdcBridgeToken(address(0), bob)
            );

        assertSourceGasTokenAction(amountIn, preExtraIn, lzFees);
        assertDestinationPolygonMintAndRefund(postExtraIn, getUsdc(dst));
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function testUsdc2Matic() public {
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveStargateBridge(
                getXChainCatPolygonMintScenarioUsdcBridgeToken(
                    getUsdc(src),
                    bob
                )
            );

        assertUsdcSourceActionBalances(lzFees, amountIn, preExtraIn);
        assertDestinationPolygonMintAndRefund(postExtraIn, getUsdc(dst));
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function testWeth2Matic() public {
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveStargateBridge(
                getXChainCatPolygonMintScenarioUsdcBridgeToken(
                    getWeth(src),
                    bob
                )
            );

        assertSourceWethAction(amountIn, preExtraIn, lzFees);
        assertDestinationPolygonMintAndRefund(postExtraIn, getUsdc(dst));
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }
}
