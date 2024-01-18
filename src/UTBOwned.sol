// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Owned} from "solmate/auth/Owned.sol";

contract UTBOwned is Owned {
    address payable utb;

    constructor() Owned(msg.sender) {}

    modifier onlyUtb() {
        require(msg.sender == utb);
        _;
    }

    function setUtb(address _utb) public onlyOwner {
        utb = payable(_utb);
    }
}
