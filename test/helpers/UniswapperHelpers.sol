// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {UniswapRouterHelpers} from "forge-toolkit/UniswapRouterHelpers.sol";
import {SwapParams, SwapDirection} from "../../src/swappers/SwapParams.sol";
import {console2} from "forge-std/console2.sol";

contract UniswapperHelpers is UniswapRouterHelpers {
    function getSwapParamsExactIn(
        string memory chain,
        address tokenIn,
        uint256 amountIn,
        address tokenOut,
        uint256 slippage
    ) public returns (SwapParams memory swapParams, uint expected) {
        bytes memory path = pathIn(chain, tokenIn, tokenOut);
        (uint _expected, bool success) = quoteIn(chain, path, amountIn);
        require(success, "error getting quoteIn");
        expected = _expected;
        uint minAmtOut = (expected * (100 - slippage)) / 100;
        swapParams = SwapParams({
            tokenIn: tokenIn,
            amountIn: amountIn,
            tokenOut: tokenOut,
            amountOut: minAmtOut,
            direction: SwapDirection.EXACT_IN,
            path: path
        });
    }

    function _debug(
        string memory chain,
        address tokenIn,
        address tokenOut,
        uint256 amountOut,
        uint256 slippage
    ) private pure {
        console2.log("getSwapParamsExactOut() chain", chain);
        console2.log("getSwapParamsExactOut() tokenIn", tokenIn);
        console2.log("getSwapParamsExactOut() tokenOut", tokenOut);
        console2.log("getSwapParamsExactOut() amountOut", amountOut);
        console2.log("getSwapParamsExactOut() slippage", slippage);
    }

    function getSwapParamsExactOut(
        string memory chain,
        address tokenIn,
        address tokenOut,
        uint256 amountOut,
        uint256 slippage
    ) public returns (SwapParams memory swapParams, uint expected) {
        switchTo(chain);
        bytes memory path = pathOut(chain, tokenIn, tokenOut);
        (uint _expected, bool success) = quoteOut(chain, path, amountOut);
        require(success, "error getting quoteOut");
        expected = _expected;

        uint maxAmtIn = (expected * (100 + slippage)) / 100;
        swapParams = SwapParams({
            tokenIn: tokenIn,
            amountIn: maxAmtIn,
            tokenOut: tokenOut,
            amountOut: amountOut,
            direction: SwapDirection.EXACT_OUT,
            path: path
        });
    }
}
