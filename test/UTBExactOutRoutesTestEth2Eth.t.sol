// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {ERC20} from "solmate/tokens/ERC20.sol";
import {UTB, SwapInstructions, SwapAndExecuteInstructions, FeeStructure} from "../src/UTB.sol";
import {UTBExecutor} from "../src/UTBExecutor.sol";
import {UniSwapper} from "../src/swappers/UniSwapper.sol";
import {SwapParams} from "../src/swappers/SwapParams.sol";
import {XChainExactOutFixture} from "./helpers/XChainExactOutFixture.sol";

contract UTBExactOutRoutesTest is XChainExactOutFixture {
    function setUp() public {
        src = optimism;
        dst = arbitrum;
        preSlippage = 2;
        postSlippage = 3;
        initialEthBalance = 1 ether;
        initialUsdcBalance = 10e6;
        MINT_GAS = 9e5;

        setRuntime(ENV_FORGE_TEST);
        loadAllChainInfo();
        setupUsdcInfo();
        setupWethHelperInfo();
        loadAllUniRouterInfo();
        setSkipFile(true);
        vm.label(alice, "alice");
        vm.label(bob, "bob");
    }

    function testSwapWethToUsdcAndMintAnNft() public {
        string memory chain = arbitrum;
        (
            UTB utb,
            /*UTBExecutor executor*/,
            UniSwapper swapper,
            ,
            ,

        ) = deployUTBAndItsComponents(chain);
        uint256 slippage = 1;

        address weth = getWeth(chain);
        address usdc = getUsdc(chain);

        cat = deployTheCat(chain);
        uint usdcOut = cat.price();

        (SwapParams memory swapParams, uint expected) = getSwapParamsExactOut(
            chain,
            weth,
            usdc,
            usdcOut,
            slippage
        );

        address payable refund = payable(alice);

        SwapInstructions memory swapInstructions = SwapInstructions({
            swapperId: swapper.getId(),
            swapPayload: abi.encode(swapParams, address(utb), refund)
        });

        mintWethTo(chain, alice, swapParams.amountIn);
        startImpersonating(alice);
        ERC20(weth).approve(address(utb), swapParams.amountIn);

        SwapAndExecuteInstructions
            memory instructions = SwapAndExecuteInstructions({
                swapInstructions: swapInstructions,
                target: address(cat),
                paymentOperator: address(cat),
                refund: refund,
                payload: abi.encodeCall(cat.mintWithUsdc, (bob))
            });

        (
            bytes memory signature,
            FeeStructure memory fees
        ) = getFeesAndSignature(instructions);

        utb.swapAndExecute(instructions, fees, signature);

        stopImpersonating();
        assertEq(cat.balanceOf(bob), 1);
        assertEq(ERC20(usdc).balanceOf(address(cat)), cat.price());
        assertEq(ERC20(weth).balanceOf(refund), swapParams.amountIn - expected);
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

    function testEth2EthWithEthFees() public {
        feeAmount = 0.00069 ether;
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveDecentBridge(
                getXChainCatEthMintScenario(address(0), bob)
            );

        assertSourceGasTokenAction(amountIn, preExtraIn, lzFees);
        assertDestinationMintAndRefund(postExtraIn);
        assertNoMoneyInDecentContractsAndCollectedFees(src, dst);
    }

    function testEth2EthWithUsdcFees() public {
        feeAmount = 0.15e6;
        feeToken = getUsdc(src);
        xChainCatMintSetup();
        (
            uint256 preExtraIn,
            uint256 postExtraIn,
            uint256 lzFees,
            uint256 amountIn
        ) = performXChainExactOutAndReceiveDecentBridge(
                getXChainCatEthMintScenario(address(0), bob)
            );

        switchTo(src);
        assertEq(usdcBalance(src, alice), initialUsdcBalance - feeAmount);
        assertSourceGasTokenAction(amountIn, preExtraIn, lzFees);
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

    function testUsdc2EthWithUsdcFees() public {
        feeAmount = 0.15e6;
        feeToken = getUsdc(src);
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
