// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {ILayerZeroMessagingLibrary} from "decent-bridge/lib/LayerZero/contracts/interfaces/ILayerZeroMessagingLibrary.sol";
import {ILayerZeroEndpoint} from "decent-bridge/lib/solidity-examples/contracts/lzApp/interfaces/ILayerZeroEndpoint.sol";
import {DcntEth} from "decent-bridge/src/DcntEth.sol";
import {SwapParams, SwapDirection} from "../src/swappers/SwapParams.sol";
import {VeryCoolCat} from "../test/helpers/VeryCoolCat.sol";
import {console2} from "forge-std/console2.sol";
import {UTBDeployHelper} from "../test/helpers/UTBDeployHelper.sol";
import {Script} from "forge-std/Script.sol";
import {LoadDeployedUTBContracts} from "../test/helpers/LoadDeployedUTBContracts.sol";
import {XChainDecentBridgeActions, XChainSwap} from "../test/helpers/XChainDecentBridgeActions.sol";
import {XChainExactInFixture} from "../test/helpers/XChainExactInFixture.sol";
import {XChainExactOutFixture} from "../test/helpers/XChainExactOutFixture.sol";

abstract contract Endpoint is ILayerZeroEndpoint {
    struct LibraryConfig {
        uint16 sendVersion;
        uint16 receiveVersion;
        address receiveLibraryAddress;
        ILayerZeroMessagingLibrary sendLibrary;
    }

    // user app config = [uaAddress]
    mapping(address => LibraryConfig) public uaConfigLookup;
}

contract CommonSetup is
    UTBDeployHelper,
    Script,
    LoadDeployedUTBContracts,
    XChainExactInFixture,
    XChainExactOutFixture
{
    function setUp() public {
        setRuntime(ENV_FORK);
        loadAllChainInfo();
        setupUsdcInfo();
        setupWethHelperInfo();
        loadAllUniRouterInfo();
        vm.label(alice, "alice");
        vm.label(bob, "bob");
        if (vm.envOr("TESTNET", false)) {
            setRuntime(ENV_TESTNET);
        } else if (vm.envOr("MAINNET", false)) {
            setRuntime(ENV_MAINNET);
        } else {
            setRuntime(ENV_FORK);
        }
        string memory depFile = "deployments.json";
        if (isMainnet()) {
            depFile = string.concat("mainnet_", depFile);
        } else if (isTestnet()) {
            depFile = string.concat("testnet_", depFile);
        } else {
            depFile = string.concat("forknet_", depFile);
        }
        setPathAndFile("deployments", depFile);
    }
}

contract DeployEverything is CommonSetup {
    function run() public {
        string memory chain = vm.envString("chain");
        deployUTBAndItsComponents(chain);
    }
}

contract DeployDecentBridge is CommonSetup {
    function run() public {
        string memory chain = vm.envString("chain");
        deployDecentBridgeRouterAndRegisterDecentEth(chain);
        addLiquidity(chain, LIQUIDITY);
    }
}

contract DeployUTB is CommonSetup {
    function run() public {
        string memory chain = vm.envString("chain");
        loadDecentBridgeContractsForChain(chain);
        deployUTBAndItsComponents(chain, false);
    }
}

contract WireUpUTB is CommonSetup {
    function run() public {
        src = vm.envString("src");
        dst = vm.envString("dst");
        bool wireUpDcntBridge = vm.envBool("wireUpDecentBridge");
        loadDeployedUTBContracts(src);
        loadDeployedUTBContracts(dst);
        wireUpXChainUTBSrcToDst(src, dst, wireUpDcntBridge);
    }
}

contract DeployNft is CommonSetup {
    function run() public {
        string memory chain = vm.envString("chain");
        deployTheCat(chain);
    }
}

contract DealToAlice is CommonSetup {
    function run() public {
        string memory chain = vm.envString("chain");
        dealTo(chain, alice, 10 ether);
    }
}

contract MintNftXchain is CommonSetup {
    function run() public {
        src = vm.envString("src");
        dst = vm.envString("dst");
        MINT_GAS = 9e5;
        loadDeployedUTBContracts(src);
        loadDeployedUTBContracts(dst);
        switchTo(dst);
        cat = VeryCoolCat(payable(getDeployment(dst, "VeryCoolCat")));
        catEthPrice = cat.ethPrice();
        switchTo(src);
        XChainSwap memory xChainSwap = getXChainCatEthMintScenario(
            address(0),
            bob
        );
        performXChain(
            xChainSwap,
            SwapDirection.EXACT_OUT,
            DECENT_BRIDGE_ID,
            false
        );
    }
}

contract GetBobsBalance is CommonSetup {
    function run() public {
        string memory chain = vm.envString("chain");
        switchTo(chain);
        cat = VeryCoolCat(payable(getDeployment(chain, "VeryCoolCat")));
        console2.log("bobs balance", cat.balanceOf(bob));
    }
}

contract MintUsdcTo is CommonSetup {
    function run() public {
        string memory chain = vm.envString("chain");
        address user = vm.envAddress("to");
        uint amount = vm.envUint("amount");
        mintUsdcTo(chain, user, amount);
    }
}

contract Simulate is CommonSetup {
    function run() public {
        string memory chain = vm.envString("chain");
        uint value = vm.envUint("value");
        bytes memory callPayload = vm.envBytes("payload");
        loadDeployedUTBContracts(chain);
        switchTo(chain);
        address sender = 0xfD92d36aADf0103b5b012d6a8013FBf9857d27Ef;
        console2.log("sender balance", sender.balance);
        startImpersonating(sender);
        (address(utbLookup[chain]).call{value: value}(callPayload));
    }
}

contract SimulateXChain is CommonSetup {
    function run() public {
        string memory src = vm.envString("src");
        string memory dst = vm.envString("dst");
        uint value = vm.envUint("value");
        uint gas = vm.envUint("gas");
        bytes memory callPayload = vm.envBytes("payload");
        loadDeployedUTBContracts(src);
        loadDeployedUTBContracts(dst);
        switchTo(src);
        address sender = 0xfD92d36aADf0103b5b012d6a8013FBf9857d27Ef;
        console2.log("sender balance", sender.balance);
        startRecordingLzMessages();
        startImpersonating(sender);
        (address(utbLookup[src]).call{value: value}(callPayload));
        deliverLzMessageAtDestination(src, dst, gas);
    }
}

contract SetNumBlockConfirmations is CommonSetup {
    DcntEth dcntEth;
    Endpoint endpoint;
    uint CONFIG_TYPE_OUTBOUND_BLOCK_CONFIRMATIONS = 5;

    function getBlockConfirmations()
        private
        view
        returns (uint16 currentConfirmations)
    {
        (
            uint16 sendVersion,
            /*uint16 receiveVersion*/,
            /*address receiveLibraryAddress*/,

        ) = endpoint.uaConfigLookup(address(dcntEth));
        bytes memory currentBlocksBytes = dcntEth.getConfig(
            sendVersion,
            lzIdLookup[dst],
            address(0),
            CONFIG_TYPE_OUTBOUND_BLOCK_CONFIRMATIONS
        );
        currentConfirmations = abi.decode(currentBlocksBytes, (uint16));
    }

    function run() public {
        src = vm.envString("src");
        dst = vm.envString("dst");
        uint16 numConfirmations = uint16(vm.envUint("num_confirmations"));
        loadDeployedUTBContracts(src);
        switchTo(src);
        dcntEth = dcntEthLookup[src];
        endpoint = Endpoint(address(lzEndpointLookup[src]));

        uint16 oldConfirmations = getBlockConfirmations();
        console2.log("old block confirmations", oldConfirmations);

        (uint16 sendVersion, , , ) = endpoint.uaConfigLookup(address(dcntEth));

        dcntEth.setConfig(
            sendVersion,
            lzIdLookup[dst],
            CONFIG_TYPE_OUTBOUND_BLOCK_CONFIRMATIONS,
            abi.encode(numConfirmations)
        );

        uint16 newConfirmations = getBlockConfirmations();
        console2.log("new block confirmations", newConfirmations);
    }
}
