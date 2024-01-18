// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {XChainExactInFixture} from "./helpers/XChainExactInFixture.sol";

contract UTBExactInRoutesTest is XChainExactInFixture {
    uint constant APPROX_BPS = 0.0001 ether;

    function setUp() public {
        src = polygon;
        dst = arbitrum;
        preSlippage = 2;
        postSlippage = 3;
        lowerDepositBps = 690;
        initialEthBalance = 1 ether;
        initialNativeChainBalance = 100 ether; // 100 matic
        initialUsdcBalance = 100e6;
        initialWethBalance = 2 ether;
        DEPOSIT_GAS = 1.5e6;
        usdcIn = 1e6;

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
        maticIn = eth2Matic(ethIn);
        weth2Deposit = shaveToken2Token(getWrapped(src), maticIn, getWeth(dst));
        usdc2Deposit = shaveUsdc2Usdc(usdcIn);

        setupXChainUTBInfra(src, dst);
        dealTo(src, alice, initialNativeChainBalance);
        mintWethTo(src, alice, initialWethBalance);
        mintUsdcTo(src, alice, initialUsdcBalance);
        mintWrappedTo(src, alice, initialNativeChainBalance);
        vault = deployTheVault(dst);
    }

    function testExactInMatic2Weth() public {
        xChainDegenBoxSetup();
        (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        ) = performXChainExactInAndReceiveDecentBridge(
                getXChainVaultDepositWeth(address(0), maticIn, weth2Deposit)
            );
        assertSrcNative(maticIn, lzFees);
        assertDstWeth(weth2Deposit, amountOut, preExtraOut, postExtraOut);
    }

    function testExactInMatic2Usdc() public {
        xChainDegenBoxSetup();
        (
            uint256 preExtraOut,
            uint256 postExtraOut,
            uint256 lzFees,
            uint256 amountOut
        ) = performXChainExactInAndReceiveDecentBridge(
                getXChainVaultDepositUsdc(address(0), maticIn, usdc2Deposit)
            );
        assertSrcNative(maticIn, lzFees);
        assertDstUsdc(usdc2Deposit, preExtraOut, postExtraOut, amountOut);
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
}
