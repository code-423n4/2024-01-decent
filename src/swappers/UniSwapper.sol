// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {UTBOwned} from "../UTBOwned.sol";
import {SwapParams} from "./SwapParams.sol";
import {SwapDirection} from "./SwapParams.sol";
import {IERC20} from "forge-std/interfaces/IERC20.sol";
import {IWETH} from "decent-bridge/src/interfaces/IWETH.sol";
import {Owned} from "solmate/auth/Owned.sol";
import {ISwapper} from "../UTB.sol";
import {IV3SwapRouter} from "@uniswap/swap-contracts/interfaces/IV3SwapRouter.sol";

contract UniSwapper is UTBOwned, ISwapper {
    constructor() UTBOwned() {}

    uint8 public constant SWAPPER_ID = 0;
    address public uniswap_router;
    address payable public wrapped;

    function setRouter(address _router) public onlyOwner {
        uniswap_router = _router;
    }

    function setWrapped(address payable _wrapped) public onlyOwner {
        wrapped = _wrapped;
    }

    function getId() public pure returns (uint8) {
        return SWAPPER_ID;
    }

    function updateSwapParams(
        SwapParams memory newSwapParams,
        bytes memory payload
    ) external pure returns (bytes memory) {
        (, address receiver, address refund) = abi.decode(
            payload,
            (SwapParams, address, address)
        );
        return abi.encode(newSwapParams, receiver, refund);
    }

    function _refundUser(address user, address token, uint amount) private {
        IERC20(token).transfer(user, amount);
    }

    function _sendToRecipient(
        address recipient,
        address token,
        uint amount
    ) private {
        if (token == address(0)) {
            token = wrapped;
        }
        IERC20(token).transfer(recipient, amount);
    }

    function swap(
        bytes memory swapPayload
    )
        external
        onlyUtb
        returns (address tokenOut, uint256 amountOut)
    {
        (SwapParams memory swapParams, address receiver, address refund) = abi
            .decode(swapPayload, (SwapParams, address, address));
        tokenOut = swapParams.tokenOut;
        if (swapParams.path.length == 0) {
            return swapNoPath(swapParams, receiver, refund);
        }
        if (swapParams.direction == SwapDirection.EXACT_IN) {
            amountOut = swapExactIn(swapParams, receiver);
        } else {
            swapExactOut(swapParams, receiver, refund);
            amountOut = swapParams.amountOut;
        }
    }

    function _receiveAndWrapIfNeeded(
        SwapParams memory swapParams
    ) private returns (SwapParams memory _swapParams) {
        if (swapParams.tokenIn != address(0)) {
            IERC20(swapParams.tokenIn).transferFrom(
                msg.sender,
                address(this),
                swapParams.amountIn
            );
            return swapParams;
        }
        swapParams.tokenIn = wrapped;
        IWETH(wrapped).deposit{value: swapParams.amountIn}();
        return swapParams;
    }

    modifier routerIsSet() {
        require(uniswap_router != address(0), "router not set");
        _;
    }

    function swapNoPath(
        SwapParams memory swapParams,
        address receiver,
        address refund
    ) public payable returns (address tokenOut, uint256 amountOut) {
        swapParams = _receiveAndWrapIfNeeded(swapParams);

        if (swapParams.direction == SwapDirection.EXACT_OUT) {
            _refundUser(
                refund,
                swapParams.tokenIn,
                swapParams.amountIn - swapParams.amountOut
            );
        }

        uint amt2Recipient = swapParams.direction == SwapDirection.EXACT_OUT
            ? swapParams.amountOut
            : swapParams.amountIn;

        _sendToRecipient(receiver, swapParams.tokenOut, amt2Recipient);
        return (swapParams.tokenOut, amt2Recipient);
    }

    function swapExactIn(
        SwapParams memory swapParams, // SwapParams is a struct
        address receiver
    ) public payable routerIsSet returns (uint256 amountOut) {
        swapParams = _receiveAndWrapIfNeeded(swapParams);

        IV3SwapRouter.ExactInputParams memory params = IV3SwapRouter
            .ExactInputParams({
                path: swapParams.path,
                recipient: address(this),
                amountIn: swapParams.amountIn,
                amountOutMinimum: swapParams.amountOut
            });

        IERC20(swapParams.tokenIn).approve(uniswap_router, swapParams.amountIn);
        amountOut = IV3SwapRouter(uniswap_router).exactInput(params);

        _sendToRecipient(receiver, swapParams.tokenOut, amountOut);
    }

    function swapExactOut(
        SwapParams memory swapParams,
        address receiver,
        address refundAddress
    ) public payable routerIsSet returns (uint256 amountIn) {
        swapParams = _receiveAndWrapIfNeeded(swapParams);
        IV3SwapRouter.ExactOutputParams memory params = IV3SwapRouter
            .ExactOutputParams({
                path: swapParams.path,
                recipient: address(this),
                //deadline: block.timestamp,
                amountOut: swapParams.amountOut,
                amountInMaximum: swapParams.amountIn
            });

        IERC20(swapParams.tokenIn).approve(uniswap_router, swapParams.amountIn);
        amountIn = IV3SwapRouter(uniswap_router).exactOutput(params);

        // refund sender
        _refundUser(
            refundAddress,
            swapParams.tokenIn,
            params.amountInMaximum - amountIn
        );

        _sendToRecipient(receiver, swapParams.tokenOut, swapParams.amountOut);
    }

    receive() external payable {}

    fallback() external payable {}
}
