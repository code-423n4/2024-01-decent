// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {IERC20} from "forge-std/interfaces/IERC20.sol";
import {Owned} from "solmate/auth/Owned.sol";

contract UTBExecutor is Owned {
    constructor() Owned(msg.sender) {}

    /**
     * @dev Executes a payment transaction with native OR ERC20.
     * @param target The address of the target contract for the payment transaction.
     * @param paymentOperator The operator address for payment transfers requiring ERC20 approvals.
     * @param payload The calldata to execute the payment transaction.
     * @param token The token being transferred, zero address for native.
     * @param amount The amount of native or ERC20 being sent with the payment transaction.
     * @param refund The account receiving any refunds, typically the EOA that initiated the transaction.
     */
    function execute(
        address target,
        address paymentOperator,
        bytes memory payload,
        address token,
        uint amount,
        address payable refund
    ) public payable onlyOwner {
        return
            execute(target, paymentOperator, payload, token, amount, refund, 0);
    }

    /**
     * @dev Executes a payment transaction with native AND/OR ERC20.
     * @param target The address of the target contract for the payment transaction.
     * @param paymentOperator The operator address for payment transfers requiring ERC20 approvals.
     * @param payload The calldata to execute the payment transaction.
     * @param token The token being transferred, zero address for native.
     * @param amount The amount of native or ERC20 being sent with the payment transaction.
     * @param refund The account receiving any refunds, typically the EOA that initiated the transaction.
     * @param extraNative Forwards additional gas or native fees required to executing the payment transaction.
     */
    function execute(
        address target,
        address paymentOperator,
        bytes memory payload,
        address token,
        uint amount,
        address payable refund,
        uint extraNative
    ) public onlyOwner {
        bool success;
        if (token == address(0)) {
            (success, ) = target.call{value: amount}(payload);
            if (!success) {
                (refund.call{value: amount}(""));
            }
            return;
        }

        uint initBalance = IERC20(token).balanceOf(address(this));

        IERC20(token).transferFrom(msg.sender, address(this), amount);
        IERC20(token).approve(paymentOperator, amount);

        if (extraNative > 0) {
            (success, ) = target.call{value: extraNative}(payload);
            if (!success) {
                (refund.call{value: extraNative}(""));
            }
        } else {
            (success, ) = target.call(payload);
        }

        uint remainingBalance = IERC20(token).balanceOf(address(this)) -
            initBalance;

        if (remainingBalance == 0) {
            return;
        }

        IERC20(token).transfer(refund, remainingBalance);
    }
}
