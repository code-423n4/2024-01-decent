// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {IERC20} from "forge-std/interfaces/IERC20.sol";
import {SwapInstructions, FeeStructure, BridgeInstructions} from "./CommonTypes.sol";
import {UTBOwned} from "./UTBOwned.sol";

contract UTBFeeCollector is UTBOwned {
    address signer;
    string constant BANNER = "\x19Ethereum Signed Message:\n32";

    constructor() UTBOwned() {}

    /**
     * @dev Sets the signer used for fee verification.
     * @param _signer The address of the signer.
     */
    function setSigner(address _signer) public onlyOwner {
        signer = _signer;
    }

    /**
     * @dev Splits an Ethereum signature into its components (r, s, v).
     * @param signature The Ethereum signature.
     */
    function splitSignature(
        bytes memory signature
    ) private pure returns (bytes32 r, bytes32 s, uint8 v) {
        require(signature.length == 65, "Invalid signature length");

        assembly {
            r := mload(add(signature, 32))
            s := mload(add(signature, 64))
            v := byte(0, mload(add(signature, 96)))
        }
    }

    /**
     * @dev Receives fees in either native or ERC20.
     * @param fees The bridge fee in native, as well as UTB fee token and amount.
     * @param packedInfo The fees and swap instructions used to generate the signature.
     * @param signature The ECDSA signature to verify the fee structure.
     */
    function collectFees(
        FeeStructure calldata fees,
        bytes memory packedInfo,
        bytes memory signature
    ) public payable onlyUtb {
        bytes32 constructedHash = keccak256(
            abi.encodePacked(BANNER, keccak256(packedInfo))
        );
        (bytes32 r, bytes32 s, uint8 v) = splitSignature(signature);
        address recovered = ecrecover(constructedHash, v, r, s);
        require(recovered == signer, "Wrong signature");
        if (fees.feeToken != address(0)) {
            IERC20(fees.feeToken).transferFrom(
                utb,
                address(this),
                fees.feeAmount
            );
        }
    }

    /**
     * @dev Redeems collected fees in the specified token and amount.
     * @param token The address of the token to be redeemed, zero address for native.
     * @param amount The amount to be redeemed.
     */
    function redeemFees(address token, uint amount) public onlyOwner {
        if (token == address(0)) {
            payable(owner).transfer(amount);
        } else {
            IERC20(token).transfer(owner, amount);
        }
    }

    receive() external payable {}

    fallback() external payable {}
}
