pragma solidity ^0.8.0;

import {SwapInstructions, FeeStructure, BridgeInstructions, SwapAndExecuteInstructions} from "../CommonTypes.sol";
import {SwapParams} from "../swappers/SwapParams.sol";

interface ISwapper {
    function getId() external returns (uint8);

    function swap(
        bytes memory swapPayload
    ) external returns (address tokenOut, uint256 amountOut);

    function updateSwapParams(
        SwapParams memory newSwapParams,
        bytes memory payload
    ) external returns (bytes memory);
}
