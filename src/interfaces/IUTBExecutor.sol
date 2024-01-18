pragma solidity ^0.8.0;

interface IUTBExecutor {

    function execute(
        address target,
        address paymentOperator,
        bytes memory payload,
        address token,
        uint256 amount,
        address refund
    ) external payable;

    function execute(
        address target,
        address paymentOperator,
        bytes memory payload,
        address token,
        uint256 amount,
        address refund,
        uint256 extraNative
    ) external;
}
