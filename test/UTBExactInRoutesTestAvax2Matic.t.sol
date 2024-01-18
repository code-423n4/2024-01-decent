// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {XChainExactInFixture} from "./helpers/XChainExactInFixture.sol";

contract UTBExactInRoutesTest is XChainExactInFixture {
    uint constant APPROX_BPS = 0.0001 ether;

    function setUp() public {
        src = avalanche;
        dst = polygon;
        preSlippage = 2;
        postSlippage = 3;
        lowerDepositBps = 690;
        initialEthBalance = 1 ether;
        initialNativeChainBalance = 10 ether; // 10 avax
        initialUsdcBalance = 100e6;
        initialWethBalance = 2 ether;
        DEPOSIT_GAS = 1.5e6;
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
        avaxIn = usdc2Native(src, usdcIn);

        setupXChainUTBInfra(src, dst);
        dealTo(src, alice, initialNativeChainBalance);
        mintWethTo(src, alice, initialWethBalance);
        mintUsdcTo(src, alice, initialUsdcBalance);
        vault = deployTheVault(dst);
    }

    function testExactInAvax2Matic() public {
        xChainDegenBoxSetup();
        (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        ) = performXChainExactInAndReceiveDecentBridge(
                getXChainVaultDepositNative(address(0), avaxIn)
            );
        assertSrcNative(avaxIn, lzFees);
        assertDstNative(
            eth2Matic(preExtraOut) + postExtraOut + amountOut,
            APPROX_BPS
        );
    }
}
