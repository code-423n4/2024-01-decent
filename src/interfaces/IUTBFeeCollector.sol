pragma solidity ^0.8.0;

import {FeeStructure} from "../CommonTypes.sol";

interface IUTBFeeCollector {

    function collectFees(
      FeeStructure memory fees,
      bytes memory packedInfo,
      bytes memory signature
    ) external payable;

    function redeemFees(address token, uint256 amount) external;

    function setSigner(address _signer) external;

    function setUtb(address _utb) external;
}
