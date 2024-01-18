// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {console2} from "forge-std/console2.sol";
import {Test} from "forge-std/Test.sol";
import {AliceAndBobScenario} from "./UniSwapper.t.sol";
import {UniswapperHelpers} from "../helpers/UniswapperHelpers.sol";
import {LoadAllChainInfo} from "forge-toolkit/LoadAllChainInfo.sol";
import {UsdcHelper} from "forge-toolkit/UsdcHelper.sol";
import {WethMintHelper} from "forge-toolkit/WethMintHelper.sol";
import {IQuoterV2} from "@uniswap/v3-periphery/contracts/interfaces/IQuoterV2.sol";

contract TryingQuoterV2 is
    Test,
    LoadAllChainInfo,
    AliceAndBobScenario,
    UsdcHelper,
    WethMintHelper,
    UniswapperHelpers
{
    function setUp() public {
        loadAllChainInfo();
        setupUsdcInfo();
        setupWethHelperInfo();
        loadAllUniRouterInfo();
    }

    function tryForChain(string memory chain) public {
        switchTo(chain);
        address usdc = getUsdc(chain);
        address wrapped = getWrapped(chain);
        address weth = getWeth(chain);

        quoteIn(chain, pathIn(chain, usdc, wrapped), 1e6);
        quoteIn(chain, pathIn(chain, usdc, weth), 1e6);
        quoteIn(chain, pathIn(chain, wrapped, weth), 0.1 ether);
    }

    function testEthereum() public {
        tryForChain(ethereum);
    }

    function testArbitrum() public {
        tryForChain(arbitrum);
    }

    function testOptimism() public {
        tryForChain(optimism);
    }

    function testPolygon() public {
        string memory chain = polygon;
        switchTo(chain);
        address usdc = getUsdc(chain);
        address wrapped = getWrapped(chain);
        address weth = getWeth(chain);

        quoteIn(chain, pathIn(chain, usdc, weth), 1e6);
        quoteIn(chain, pathIn(chain, wrapped, weth), 0.1 ether);
    }

    function testUsdcToWrappedMaticPolygon() public {
        string memory chain = polygon;
        switchTo(chain);
        address usdc = getUsdc(chain);
        address wrapped = getWrapped(chain);

        (uint amount, bool success) = quoteIn(
            chain,
            pathIn(chain, usdc, wrapped, 500),
            6.9e6
        );
        console2.log("amount is", amount);
        console2.log("success", success);
        console2.log("wrapped", wrapped);
        assertTrue(success);
        assertGt(amount, 0);
    }

    function testAvalanche() public {
        string memory chain = avalanche;
        switchTo(chain);
        address usdc = getUsdc(chain);
        address wrapped = getWrapped(chain);
        address weth = getWeth(chain);

        quoteIn(chain, pathIn(chain, usdc, weth), 1e6);
        quoteIn(chain, pathIn(chain, wrapped, weth), 0.1 ether);
    }
}
