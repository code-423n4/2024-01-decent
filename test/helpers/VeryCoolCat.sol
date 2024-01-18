// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {ERC721} from "solmate/tokens/ERC721.sol";
import {ERC20} from "solmate/tokens/ERC20.sol";
import {Owned} from "solmate/auth/Owned.sol";
import {console2} from "forge-std/console2.sol";

contract VeryCoolCat is ERC721, Owned {
    ERC20 usdc;
    ERC20 weth;
    uint public price = 6.9e6;
    uint public wethPrice = 0.001 ether;
    uint public ethPrice = 0.001 ether;
    uint public polygonPrice = 10 ether;
    uint count = 0;

    constructor() ERC721("cool cat", "cool") Owned(msg.sender) {}

    function setWeth(address _addr) public onlyOwner {
        weth = ERC20(_addr);
    }

    function setUsdc(address _addr) public onlyOwner {
        usdc = ERC20(_addr);
    }

    function tokenURI(uint256 /*id*/) public pure override returns (string memory) {
        return "";
    }

    function mint(address to) private {
        count += 1;
        console2.log("minting to", to, count);
        _mint(to, count);
    }

    function mintWithUsdc(address to) public {
        usdc.transferFrom(msg.sender, address(this), price);
        mint(to);
    }

    function mintWithWeth(address to) public {
        weth.transferFrom(msg.sender, address(this), wethPrice);
        mint(to);
    }

    function mintWithEth(address to) public payable {
        require(msg.value >= ethPrice);
        mint(to);
    }

    function mintWithPolygon(address to) public payable {
        require(msg.value >= polygonPrice);
        mint(to);
    }

    receive() external payable {}

    fallback() external payable {}
}
