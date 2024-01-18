// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

library SwapDirection {
    uint8 constant EXACT_IN = 0;
    uint8 constant EXACT_OUT = 1;
}

struct SwapParams {
    uint256 amountIn;
    uint256 amountOut;
    address tokenIn;
    address tokenOut;
    uint8 direction;
    // if direction is exactAmountIn
    // then amount out will be the minimum amount out
    // if direction is exactAmountOutA
    // then amount in is maximum amount in
    bytes path;
}
