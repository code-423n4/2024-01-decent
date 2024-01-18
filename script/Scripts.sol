// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// forge contracts
import "forge-std/Script.sol";
import "forge-std/console2.sol";

// bridge contracts
import {DecentBridgeExecutor} from "../lib/decent-bridge/src/DecentBridgeExecutor.sol";
import {DecentEthRouter} from "../lib/decent-bridge/src/DecentEthRouter.sol";
import {DcntEth} from "../lib/decent-bridge/src/DcntEth.sol";

// utb contracts
import {UTB} from "../src/UTB.sol";
import {UTBExecutor} from "../src/UTBExecutor.sol";
import {UTBFeeCollector} from "../src/UTBFeeCollector.sol";
import {UniSwapper} from "../src/swappers/UniSwapper.sol";
import {DecentBridgeAdapter} from "../src/bridge_adapters/DecentBridgeAdapter.sol";
import {StargateBridgeAdapter} from "../src/bridge_adapters/StargateBridgeAdapter.sol";

// forge toolkit contract
import {LoadAllChainInfo} from "forge-toolkit/LoadAllChainInfo.sol";
import {UniswapRouterHelpers} from "forge-toolkit/UniswapRouterHelpers.sol";

// eip contracts
import {ERC20} from "solmate/tokens/ERC20.sol";

contract Tasks is LoadAllChainInfo, UniswapRouterHelpers {
    string constant DEPLOY_FILE = "./deployments/addresses.json";
    uint256 constant SIGNER_PRIVATE_KEY = uint256(0xC0FFEE);
    uint constant MIN_DST_GAS = 100_000;

    constructor() {
        loadAllChainInfo();
    }

    function logDeployment(string memory contractName, address contractAddress) internal {
        string memory chain = vm.envString("CHAIN");
        string memory json;
        json = vm.serializeAddress(json, contractName, contractAddress);
        vm.writeJson(json, DEPLOY_FILE, string.concat(".", chain));
    }

    function getDeployment(
        string memory chain,
        string memory contractName
    ) internal returns (address deployment) {
        string memory json = vm.readFile(DEPLOY_FILE);
        string memory path = string.concat(".", chain, ".", contractName);
        string memory label = string.concat(chain, "_", contractName);
        deployment = vm.parseJsonAddress(json, path);
        vm.label(deployment, label);
    }

    function deployBridge() internal returns (
        DecentBridgeExecutor decentBridgeExecutor,
        DecentEthRouter decentEthRouter,
        DcntEth dcntEth
    ) {
        string memory chain = vm.envString("CHAIN");
        address weth = wethLookup[chain];
        bool isGasEth = gasEthLookup[chain];

        decentBridgeExecutor = new DecentBridgeExecutor(weth, isGasEth);
        decentEthRouter = new DecentEthRouter(payable(weth), isGasEth, address(decentBridgeExecutor));
        decentBridgeExecutor.transferOwnership(address(decentEthRouter));

        address lzEndpoint = address(lzEndpointLookup[chain]);

        dcntEth = new DcntEth(lzEndpoint);
        dcntEth.setRouter(address(decentEthRouter));
        decentEthRouter.registerDcntEth(address(dcntEth));
    }

    function deployUtb(
        address decentEthRouter,
        address decentBridgeExecutor
    ) internal returns (
        UTB utb,
        UTBExecutor utbExecutor,
        UTBFeeCollector utbFeeCollector,
        UniSwapper uniSwapper,
        DecentBridgeAdapter decentBridgeAdapter,
        StargateBridgeAdapter stargateBridgeAdapter
    ) {
        string memory chain = vm.envString("CHAIN");
        address wrapped = wrappedLookup[chain];

        utb = new UTB();
        utb.setWrapped(payable(wrapped));

        utbExecutor = deployUtbExecutor(address(utb));
        utbFeeCollector = deployUtbFeeCollector(address(utb));
        uniSwapper = deployUniSwapper(address(utb));
        decentBridgeAdapter = deployDecentBridgeAdapter(
            address(utb),
            address(decentEthRouter),
            address(decentBridgeExecutor)
        );
        stargateBridgeAdapter = deployStargateBridgeAdapter(address(utb));
    }

    function deployUtbExecutor(address utb) internal returns (UTBExecutor utbExecutor) {
        utbExecutor = new UTBExecutor();
        utbExecutor.transferOwnership(utb);
        UTB(payable(utb)).setExecutor(address(utbExecutor));
    }

    function deployUtbFeeCollector(address utb) internal returns (UTBFeeCollector utbFeeCollector) {
        utbFeeCollector = new UTBFeeCollector();
        utbFeeCollector.setUtb(utb);
        utbFeeCollector.setSigner(vm.addr(SIGNER_PRIVATE_KEY));
        UTB(payable(utb)).setFeeCollector(payable(address(utbFeeCollector)));
    }

    function deployUniSwapper(address utb) internal returns (UniSwapper uniSwapper) {
        string memory chain = vm.envString("CHAIN");
        address wrapped = wrappedLookup[chain];
        address uniRouter = uniRouterLookup[chain];

        uniSwapper = new UniSwapper();
        uniSwapper.setWrapped(payable(wrapped));
        uniSwapper.setRouter(uniRouter);
        uniSwapper.setUtb(utb);
        UTB(payable(utb)).registerSwapper(address(uniSwapper));
    }

    function deployDecentBridgeAdapter(
        address utb,
        address decentEthRouter,
        address decentBridgeExecutor
    ) internal returns (
        DecentBridgeAdapter decentBridgeAdapter
    ) {
        string memory chain = vm.envString("CHAIN");
        bool gasIsEth = gasEthLookup[chain];
        address weth = wethLookup[chain];
        address bridgeToken = gasIsEth ? address(0) : weth;

        decentBridgeAdapter = new DecentBridgeAdapter(gasIsEth, bridgeToken);
        decentBridgeAdapter.setUtb(utb);
        decentBridgeAdapter.setRouter(decentEthRouter);
        decentBridgeAdapter.setBridgeExecutor(decentBridgeExecutor);
        UTB(payable(utb)).registerBridge(address(decentBridgeAdapter));
    }

    function deployStargateBridgeAdapter(
        address utb
    ) internal returns (
        StargateBridgeAdapter stargateBridgeAdapter
    ) {
        string memory chain = vm.envString("CHAIN");
        address stargateComposer = sgComposerLookup[chain];

        stargateBridgeAdapter = new StargateBridgeAdapter();
        stargateBridgeAdapter.setUtb(utb);
        stargateBridgeAdapter.setRouter(stargateComposer);
        stargateBridgeAdapter.setBridgeExecutor(stargateComposer);
        UTB(payable(utb)).registerBridge(address(stargateBridgeAdapter));
    }

    function connectBridge(
        address _srcDcntEth,
        address dstDcntEth,
        address _srcDecentEthRouter,
        address dstDecentEthRouter,
        uint16 dstLzId
    ) internal {
        DcntEth srcDcntEth = DcntEth(_srcDcntEth);
        DecentEthRouter srcDecentEthRouter = DecentEthRouter(payable(_srcDecentEthRouter));

        srcDecentEthRouter.addDestinationBridge(dstLzId, dstDecentEthRouter);
        srcDcntEth.setTrustedRemote(dstLzId, abi.encodePacked(dstDcntEth, srcDcntEth));
        srcDcntEth.setMinDstGas(
            dstLzId,
            srcDcntEth.PT_SEND_AND_CALL(),
            MIN_DST_GAS
        );
    }

    function connectUtb(
        address _srcDecentBridgeAdapter,
        address dstDecentBridgeAdapter,
        address _srcStargateBridgeAdapter,
        address dstStargateBridgeAdapter,
        uint256 dstChainId,
        uint16 dstLzId
    ) internal {
        DecentBridgeAdapter srcDecentBridgeAdapter = DecentBridgeAdapter(payable(_srcDecentBridgeAdapter));
        StargateBridgeAdapter srcStargateBridgeAdapter = StargateBridgeAdapter(payable(_srcStargateBridgeAdapter));

        srcDecentBridgeAdapter.registerRemoteBridgeAdapter(dstChainId, dstLzId, dstDecentBridgeAdapter);
        srcStargateBridgeAdapter.registerRemoteBridgeAdapter(dstChainId, dstLzId, dstStargateBridgeAdapter);
    }

    function addLiquidity(address _decentEthRouter, uint256 amount) public {
        string memory chain = vm.envString("CHAIN");
        DecentEthRouter decentEthRouter = DecentEthRouter(payable(_decentEthRouter));

        if (gasEthLookup[chain]) {
            decentEthRouter.addLiquidityEth{value: amount}();
        } else {
            ERC20(wethLookup[chain]).approve(address(decentEthRouter), amount);
            decentEthRouter.addLiquidityWeth(amount);
        }
    }

    function removeLiquidity(address _decentEthRouter, uint256 amount) public {
        string memory chain = vm.envString("CHAIN");
        DecentEthRouter decentEthRouter = DecentEthRouter(payable(_decentEthRouter));

        if (gasEthLookup[chain]) {
            decentEthRouter.removeLiquidityEth(amount);
        } else {
            decentEthRouter.removeLiquidityWeth(amount);
        }
    }
}

contract Deploy is Script, Tasks {
    function run() external {
        string memory chain = vm.envString("CHAIN");
        uint256 account = vm.envUint(vm.envString("PRIVATE_KEY"));

        require(wethLookup[chain] != address(0), string.concat('no weth for chain: ', chain));
        require(wrappedLookup[chain] != address(0), string.concat('no wrapped for chain: ', chain));
        require(address(lzEndpointLookup[chain]) != address(0), string.concat('no lz endpoint for chain: ', chain));
        // require(uniRouterLookup[chain] != address(0), string.concat('no uniswap router for chain: ', chain));
        // require(sgComposerLookup[chain] != address(0), string.concat('no stargate composer for chain: ', chain));

        vm.startBroadcast(account);

        (
            DecentBridgeExecutor decentBridgeExecutor,
            DecentEthRouter decentEthRouter,
            DcntEth dcntEth
        ) = deployBridge();

        (
            UTB utb,
            UTBExecutor utbExecutor,
            UTBFeeCollector utbFeeCollector,
            UniSwapper uniSwapper,
            DecentBridgeAdapter decentBridgeAdapter,
            StargateBridgeAdapter stargateBridgeAdapter
        ) = deployUtb(
            address(decentEthRouter),
            address(decentBridgeExecutor)
        );

        vm.stopBroadcast();

        logDeployment("DecentBridgeExecutor", address(decentBridgeExecutor));
        logDeployment("DecentEthRouter", address(decentEthRouter));
        logDeployment("DcntEth", address(dcntEth));
        logDeployment("UTB", address(utb));
        logDeployment("UTBExecutor", address(utbExecutor));
        logDeployment("UTBFeeCollector", address(utbFeeCollector));
        logDeployment("UniSwapper", address(uniSwapper));
        logDeployment("DecentBridgeAdapter", address(decentBridgeAdapter));
        logDeployment("StargateBridgeAdapter", address(stargateBridgeAdapter));
    }
}

contract AddLiquidity is Script, Tasks {
    function run() external {
        string memory chain = vm.envString("CHAIN");
        uint256 amount = vm.envUint("AMOUNT");
        uint256 account = vm.envUint(vm.envString("PRIVATE_KEY"));

        vm.startBroadcast(account);

        address decentEthRouter = getDeployment(chain, "DecentEthRouter");
        addLiquidity(decentEthRouter, amount);

        vm.stopBroadcast();
    }
}

contract RemoveLiquidity is Script, Tasks {
    function run() external {
        string memory chain = vm.envString("CHAIN");
        uint256 amount = vm.envUint("AMOUNT");
        uint256 account = vm.envUint(vm.envString("PRIVATE_KEY"));

        vm.startBroadcast(account);

        address decentEthRouter = getDeployment(chain, "DecentEthRouter");
        removeLiquidity(decentEthRouter, amount);

        vm.stopBroadcast();
    }
}

contract Connect is Script, Tasks {
    function run() external {
        string memory src = vm.envString("SRC");
        string memory dst = vm.envString("DST");
        uint256 account = vm.envUint(vm.envString("PRIVATE_KEY"));

        address srcDcntEth = getDeployment(src, "DcntEth");
        address dstDcntEth = getDeployment(dst, "DcntEth");

        address srcDecentEthRouter = getDeployment(src, "DecentEthRouter");
        address dstDecentEthRouter = getDeployment(dst, "DecentEthRouter");

        address srcDecentBridgeAdapter = getDeployment(src, "DecentBridgeAdapter");
        address dstDecentBridgeAdapter = getDeployment(dst, "DecentBridgeAdapter");

        address srcStargateBridgeAdapter = getDeployment(src, "StargateBridgeAdapter");
        address dstStargateBridgeAdapter = getDeployment(dst, "StargateBridgeAdapter");

        uint16 dstLzId = lzIdLookup[dst];
        uint256 dstChainId = chainIdLookup[dst];

        require(dstLzId != 0, string.concat('no lz id for chain: ', dst));
        require(dstChainId != 0, string.concat('no chain id for chain: ', dst));

        vm.startBroadcast(account);

        connectBridge(
            srcDcntEth,
            dstDcntEth,
            srcDecentEthRouter,
            dstDecentEthRouter,
            dstLzId
        );

        connectUtb(
            srcDecentBridgeAdapter,
            dstDecentBridgeAdapter,
            srcStargateBridgeAdapter,
            dstStargateBridgeAdapter,
            dstChainId,
            dstLzId
        );

        vm.stopBroadcast();
    }
}
