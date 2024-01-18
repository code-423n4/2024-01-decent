pragma solidity ^0.8.0;

import {SwapInstructions, FeeStructure, BridgeInstructions, SwapAndExecuteInstructions} from "../CommonTypes.sol";

interface IUTB {

    function bridgeAndExecute(
        BridgeInstructions memory instructions,
        FeeStructure memory fees,
        bytes memory signature
    ) external payable returns (bytes memory);

    function receiveFromBridge(
        SwapInstructions memory postBridge,
        address target,
        address paymentOperator,
        bytes memory payload,
        address refund
    ) external;

    function registerBridge(address bridge) external;

    function registerSwapper(address swapper) external;

    function setExecutor(address _executor) external;

    function setFeeCollector(address _feeCollector) external;

    function setWrapped(address _wrapped) external;

    function swapAndExecute(
        SwapAndExecuteInstructions memory instructions,
        FeeStructure memory fees,
        bytes memory signature
    ) external payable;
}
