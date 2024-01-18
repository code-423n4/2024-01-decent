// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {UTBOwned} from "../UTBOwned.sol";

contract BaseAdapter is UTBOwned {
    address public bridgeExecutor;

    constructor() UTBOwned() {}

    modifier onlyExecutor() {
        require(
            msg.sender == address(bridgeExecutor),
            "Only bridge executor can call this"
        );
        _;
    }

    function setBridgeExecutor(address _executor) public onlyOwner {
        bridgeExecutor = _executor;
    }
}
