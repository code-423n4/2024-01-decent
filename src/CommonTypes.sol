// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

struct SwapInstructions {
    uint8 swapperId;
    bytes swapPayload;
}

struct FeeStructure {
    uint bridgeFee;
    address feeToken;
    uint feeAmount;
}

struct SwapAndExecuteInstructions {
    SwapInstructions swapInstructions;
    address target;
    address paymentOperator;
    address payable refund;
    bytes payload;
}

struct BridgeInstructions {
    SwapInstructions preBridge;
    SwapInstructions postBridge;
    uint8 bridgeId;
    uint256 dstChainId;
    address target;
    address paymentOperator;
    address payable refund;
    bytes payload;
    bytes additionalArgs;
}
