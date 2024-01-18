// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {IERC20} from "forge-std/interfaces/IERC20.sol";
import {UTBOwned} from "../UTBOwned.sol";
import {IUTB} from "../interfaces/IUTB.sol";
import {IBridgeAdapter} from "../interfaces/IBridgeAdapter.sol";
import {SwapInstructions} from "../CommonTypes.sol";
import {SwapParams} from "../swappers/SwapParams.sol";
import {IStargateRouter, LzBridgeData} from "./stargate/IStargateRouter.sol";
import {IStargateReceiver} from "./stargate/IStargateReceiver.sol";
import {BaseAdapter} from "./BaseAdapter.sol";

// pool ids: https://stargateprotocol.gitbook.io/stargate/developers/pool-ids
// chain ids: https://stargateprotocol.gitbook.io/stargate/developers/chain-ids

contract StargateBridgeAdapter is
    BaseAdapter,
    IBridgeAdapter,
    IStargateReceiver
{
    uint8 public constant BRIDGE_ID = 1;
    uint8 public constant SG_FEE_BPS = 6;
    address public stargateEth;
    mapping(uint256 => address) public destinationBridgeAdapter;
    mapping(uint256 => uint16) lzIdLookup;
    mapping(uint16 => uint256) chainIdLookup;

    constructor() BaseAdapter() {}

    IStargateRouter public router;

    function setRouter(address _router) public onlyOwner {
        router = IStargateRouter(_router);
    }

    function setStargateEth(address _sgEth) public onlyOwner {
        stargateEth = _sgEth;
    }

    function getId() public pure returns (uint8) {
        return BRIDGE_ID;
    }

    function registerRemoteBridgeAdapter(
        uint256 dstChainId,
        uint16 dstLzId,
        address decentBridgeAdapter
    ) public onlyOwner {
        lzIdLookup[dstChainId] = dstLzId;
        chainIdLookup[dstLzId] = dstChainId;
        destinationBridgeAdapter[dstChainId] = decentBridgeAdapter;
    }

    function getBridgeToken(
        bytes calldata additionalArgs
    ) external pure returns (address bridgeToken) {
        bridgeToken = abi.decode(additionalArgs, (address));
    }

    function getBridgedAmount(
        uint256 amt2Bridge,
        address /*tokenIn*/,
        address /*tokenOut*/
    ) external pure returns (uint256) {
        return (amt2Bridge * (1e4 - SG_FEE_BPS)) / 1e4;
    }

    function bridge(
        uint256 amt2Bridge,
        SwapInstructions memory postBridge,
        uint256 dstChainId,
        address target,
        address paymentOperator,
        bytes memory payload,
        bytes calldata additionalArgs,
        address payable refund
    ) public payable onlyUtb returns (bytes memory bridgePayload) {
        address bridgeToken = abi.decode(additionalArgs, (address));

        bridgePayload = abi.encode(
            postBridge,
            target,
            paymentOperator,
            payload,
            refund
        );
        IERC20(bridgeToken).transferFrom(msg.sender, address(this), amt2Bridge);
        IERC20(bridgeToken).approve(address(router), amt2Bridge);

        callBridge(
            amt2Bridge,
            dstChainId,
            bridgePayload,
            additionalArgs,
            refund
        );
    }

    function getValue(
        bytes calldata additionalArgs,
        uint256 amt2Bridge
    ) private view returns (uint value) {
        (address bridgeToken, LzBridgeData memory lzBridgeData) = abi.decode(
            additionalArgs,
            (address, LzBridgeData)
        );
        return
            bridgeToken == stargateEth
                ? (lzBridgeData.fee + amt2Bridge)
                : lzBridgeData.fee;
    }

    function getLzTxObj(
        bytes calldata additionalArgs
    ) private pure returns (IStargateRouter.lzTxObj memory) {
        (, , IStargateRouter.lzTxObj memory lzTxObj) = abi.decode(
            additionalArgs,
            (address, LzBridgeData, IStargateRouter.lzTxObj)
        );
        return lzTxObj;
    }

    function getDstChainId(
        bytes calldata additionalArgs
    ) private pure returns (uint16) {
        (, LzBridgeData memory lzBridgeData, ) = abi.decode(
            additionalArgs,
            (address, LzBridgeData, IStargateRouter.lzTxObj)
        );
        return lzBridgeData._dstChainId;
    }

    function getSrcPoolId(
        bytes calldata additionalArgs
    ) private pure returns (uint120) {
        (, LzBridgeData memory lzBridgeData, ) = abi.decode(
            additionalArgs,
            (address, LzBridgeData, IStargateRouter.lzTxObj)
        );
        return lzBridgeData._srcPoolId;
    }

    function getDstPoolId(
        bytes calldata additionalArgs
    ) private pure returns (uint120) {
        (, LzBridgeData memory lzBridgeData, ) = abi.decode(
            additionalArgs,
            (address, LzBridgeData, IStargateRouter.lzTxObj)
        );
        return lzBridgeData._dstPoolId;
    }

    function getDestAdapter(uint chainId) private view returns (address dstAddr) {
        dstAddr = destinationBridgeAdapter[chainId];

        require(
            dstAddr != address(0),
            string.concat("dst chain address not set ")
        );
    }

    function callBridge(
        uint256 amt2Bridge,
        uint256 dstChainId,
        bytes memory bridgePayload,
        bytes calldata additionalArgs,
        address payable refund
    ) private {
        router.swap{value: msg.value}(
            getDstChainId(additionalArgs), //lzBridgeData._dstChainId, // send to LayerZero chainId
            getSrcPoolId(additionalArgs), //lzBridgeData._srcPoolId, // source pool id
            getDstPoolId(additionalArgs), //lzBridgeData._dstPoolId, // dst pool id
            refund, // refund adddress. extra gas (if any) is returned to this address
            amt2Bridge, // quantity to swap
            (amt2Bridge * (10000 - SG_FEE_BPS)) / 10000, // the min qty you would accept on the destination, fee is 6 bips
            getLzTxObj(additionalArgs), // additional gasLimit increase, airdrop, at address
            abi.encodePacked(getDestAdapter(dstChainId)),
            bridgePayload // bytes param, if you wish to send additional payload you can abi.encode() them here
        );
    }

    function sgReceive(
        uint16, // _srcChainid
        bytes memory, // _srcAddress
        uint256, // _nonce
        address, // _token
        uint256, // amountLD
        bytes memory payload
    ) external override onlyExecutor {
        (
            SwapInstructions memory postBridge,
            address target,
            address paymentOperator,
            bytes memory utbPayload,
            address payable refund
        ) = abi.decode(
                payload,
                (SwapInstructions, address, address, bytes, address)
            );

        SwapParams memory swapParams = abi.decode(
            postBridge.swapPayload,
            (SwapParams)
        );

        IERC20(swapParams.tokenIn).approve(utb, swapParams.amountIn);

        IUTB(utb).receiveFromBridge(
            postBridge,
            target,
            paymentOperator,
            utbPayload,
            refund
        );
    }

    receive() external payable {}

    fallback() external payable {}
}
