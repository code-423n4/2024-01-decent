// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";

contract UTBFeeCollector is Test {
    string BANNER = "\x19Ethereum Signed Message:\n32";

    //function testValidateFee() public {
    //    uint256 privateKey = 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;
    //    bytes32 hash = keccak256(abi.encodePacked(tokenIds, songSelections));
    //    console2.logBytes32(hash);

    //    bytes32 ethSignedHash = keccak256(abi.encodePacked(BANNER, hash));

    //    (uint8 v, bytes32 r, bytes32 s) = vm.sign(privateKey, ethSignedHash);
    //    bytes memory signature = abi.encodePacked(r, s, v);
    //}

    //function onTheReceiverSide() {
    //    bytes32 messageHash = keccak256(
    //        abi.encodePacked(tokenIds, songSelections)
    //    );

    //    bytes32 ethSignedHash = keccak256(
    //        abi.encodePacked("\x19Ethereum Signed Message:\n32", messageHash)
    //    );

    //    address signer = recoverSigner(ethSignedHash, signature);
    //}
}
