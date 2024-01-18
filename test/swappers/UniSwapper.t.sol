// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {ERC20} from "solmate/tokens/ERC20.sol";
import {WETH} from "solmate/tokens/WETH.sol";
import {Test} from "forge-std/Test.sol";
import {CommonBase} from "forge-std/Base.sol";
import {BaseChainSetup} from "forge-toolkit/BaseChainSetup.sol";
import {LoadAllChainInfo} from "forge-toolkit/LoadAllChainInfo.sol";
import {ChainAliases} from "forge-toolkit/ChainAliases.sol";
import {console2} from "forge-std/console2.sol";
import {UsdcHelper} from "forge-toolkit/UsdcHelper.sol";
import {UniSwapper} from "../../src/swappers/UniSwapper.sol";
import {SwapParams, SwapDirection} from "../../src/swappers/SwapParams.sol";
import {UniswapperHelpers} from "../helpers/UniswapperHelpers.sol";
import {WethMintHelper} from "forge-toolkit/WethMintHelper.sol";

contract AliceAndBobScenario is ChainAliases {
    address alice = address(0xa11ce);
    address bob = address(0xb0b);
}

contract UniSwapperTest is
    Test,
    BaseChainSetup,
    LoadAllChainInfo,
    AliceAndBobScenario,
    UsdcHelper,
    WethMintHelper,
    UniswapperHelpers
{
    string chain;
    uint slippage = 2;

    constructor() {
        setRuntime(ENV_FORGE_TEST);
        chain = arbitrum;
    }

    function setUp() public {
        loadAllChainInfo();
        setupUsdcInfo();
        setupWethHelperInfo();
        loadAllUniRouterInfo();
        vm.label(alice, "alice");
        vm.label(bob, "bob");
    }

    function deploySwapper() private returns (UniSwapper) {
        // setting up the swapper with wrapped token and uni router
        UniSwapper swapper = new UniSwapper();
        swapper.setWrapped(getWrapped(chain));
        swapper.setRouter(getUniRouter(chain));
        assertEq(swapper.wrapped(), wethLookup[chain]);
        return swapper;
    }

    function testSwapUsdcToWETHExactIn() public {
        // buys eth with 4 usdc
        uint usdcAmount = 4e6;
        mintUsdcTo(chain, alice, usdcAmount);
        uint aliceBalance = usdcBalance(chain, alice);

        assertEq(aliceBalance, usdcAmount);

        UniSwapper swapper = deploySwapper();

        address usdc = getUsdc(chain);
        address weth = getWeth(chain);

        (SwapParams memory swapParams, uint expected) = getSwapParamsExactIn(
            chain,
            usdc,
            usdcAmount,
            weth,
            slippage
        );

        startImpersonating(alice);
        ERC20(usdc).approve(address(swapper), usdcAmount);
        swapper.swapExactIn(swapParams, bob);
        stopImpersonating();

        assertEq(wethBalance(chain, bob), expected);
    }

    function testSwapWETHToUSDCExactIn() public {
        // buys USDC with some eth
        uint wethAmount = 0.001 ether;
        mintWethTo(chain, alice, wethAmount);

        // alice now has  WETH
        UniSwapper swapper = deploySwapper();

        address usdc = getUsdc(chain);
        address weth = getWeth(chain);

        (SwapParams memory swapParams, uint expected) = getSwapParamsExactIn(
            chain,
            weth,
            wethAmount,
            usdc,
            slippage
        );

        startImpersonating(alice);
        ERC20(weth).approve(address(swapper), wethAmount);
        swapper.swapExactIn(swapParams, bob);
        stopImpersonating();

        assertEq(usdcBalance(chain, bob), expected);
    }

    function testSwapEthToUsdcExactIn() public {
        uint ethAmount = 0.001 ether;
        dealTo(chain, alice, ethAmount);

        // alice now has  WETH
        UniSwapper swapper = deploySwapper();

        address eth = address(0);
        address usdc = getUsdc(chain);

        (SwapParams memory swapParams, uint expected) = getSwapParamsExactIn(
            chain,
            eth,
            ethAmount,
            usdc,
            slippage
        );

        startImpersonating(alice);
        swapper.swapExactIn{value: ethAmount}(swapParams, bob);
        stopImpersonating();

        assertEq(usdcBalance(chain, bob), expected);
    }

    function testSwapUsdcToWETHExactOut() public {
        // we want this much weth out
        uint wethAmount = 0.002 ether;

        address usdc = getUsdc(chain);
        address weth = getWeth(chain);

        (SwapParams memory swapParams, uint expected) = getSwapParamsExactOut(
            chain,
            usdc,
            weth,
            wethAmount,
            slippage
        );

        uint usdcAmount = swapParams.amountIn;
        mintUsdcTo(chain, alice, usdcAmount);

        UniSwapper swapper = deploySwapper();

        startImpersonating(alice);
        ERC20(usdc).approve(address(swapper), usdcAmount);
        swapper.swapExactOut(swapParams, bob, alice);
        stopImpersonating();

        assertEq(wethBalance(chain, bob), wethAmount);
        assertEq(usdcBalance(chain, alice), usdcAmount - expected);
    }
}
