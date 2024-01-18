// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {ERC20} from "solmate/tokens/ERC20.sol";
import {Owned} from "solmate/auth/Owned.sol";

contract DegenVault is Owned {
    constructor() Owned(msg.sender) {}

    ERC20 usdc;
    ERC20 weth;

    function setWeth(address _addr) public onlyOwner {
        weth = ERC20(_addr);
    }

    function setUsdc(address _addr) public onlyOwner {
        usdc = ERC20(_addr);
    }

    function depositUsdc(uint256 amount) public {
        usdc.transferFrom(msg.sender, address(this), amount);
    }

    function depositWeth(uint256 amount) public {
        weth.transferFrom(msg.sender, address(this), amount);
    }

    function depositNative() public payable {}

    function depositAndFail() public payable {
        revert("aaahhh Im failing");
    }

    receive() external payable {}

    fallback() external payable {}
}
