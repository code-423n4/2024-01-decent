// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {console2} from "forge-std/console2.sol";
import {UTBExecutor} from "../../src/UTBExecutor.sol";
import {UTBFeeCollector} from "../../src/UTBFeeCollector.sol";
import {UTB, ISwapper} from "../../src/UTB.sol";
import {UniSwapper} from "../../src/swappers/UniSwapper.sol";
import {DecentEthRouter} from "decent-bridge/src/DecentEthRouter.sol";
import {RouterActions} from "decent-bridge/test/common/RouterActions.sol";
import {UniswapperHelpers} from "./UniswapperHelpers.sol";
import {DecentBridgeAdapter} from "../../src/bridge_adapters/DecentBridgeAdapter.sol";
import {StargateBridgeAdapter} from "../../src/bridge_adapters/StargateBridgeAdapter.sol";

contract UTBDeployHelper is RouterActions, UniswapperHelpers {
    mapping(string => DecentBridgeAdapter) decentBridgeAdapterLookup;
    mapping(string => StargateBridgeAdapter) sgBridgeAdapterLookup;
    mapping(string => ISwapper) swapperLookup;
    mapping(string => UTB) utbLookup;
    mapping(string => UTBFeeCollector) feeCollectorLookup;
    uint256 constant LIQUIDITY = 10 ether;
    uint256 constant SIGNER_PRIVATE_KEY = uint256(0xC0FFEE);

    function deployUTB(string memory chain) public returns (UTB utb) {
        switchTo(chain);
        utb = UTB(payable(deployChain(chain, "UTB", "UTB.sol:UTB", "")));
        while (address(utb).balance > 0) {
            console2.log("deployed to existing address, skipping...");
            utb = UTB(payable(deployChain(chain, "UTB", "UTB.sol:UTB", "")));
        }
        utbLookup[chain] = utb;
        utb.setWrapped(getWrapped(chain));
        dump();
    }

    function deployExecutor(
        string memory chain,
        address payable utb
    ) public returns (UTBExecutor utbExecutor) {
        switchTo(chain);

        utbExecutor = UTBExecutor(
            payable(
                deployChain(
                    chain,
                    "utbExecutor",
                    "UTBExecutor.sol:UTBExecutor",
                    ""
                )
            )
        );

        utbExecutor.transferOwnership(utb);
        UTB(utb).setExecutor(address(utbExecutor));
        dump();
    }

    function deployFeeCollector(
        string memory chain,
        address payable utb
    ) public returns (UTBFeeCollector feeCollector) {
        feeCollector = UTBFeeCollector(
            payable(
                deployChain(
                    chain,
                    "UTBFeeCollector",
                    "UTBFeeCollector.sol:UTBFeeCollector",
                    ""
                )
            )
        );

        feeCollector.setUtb(utb);
        feeCollector.setSigner(vm.addr(SIGNER_PRIVATE_KEY));
        UTB(utb).setFeeCollector(payable(address(feeCollector)));
        feeCollectorLookup[chain] = feeCollector;
        dump();
    }

    function deployUniSwapper(
        string memory chain,
        address payable utb
    ) public returns (UniSwapper swapper) {
        swapper = UniSwapper(
            payable(
                deployChain(
                    chain,
                    "UniSwapper",
                    "UniSwapper.sol:UniSwapper",
                    ""
                )
            )
        );

        swapperLookup[chain] = swapper;
        swapper.setWrapped(getWrapped(chain));
        swapper.setRouter(getUniRouter(chain));
        swapper.setUtb(utb);
        UTB(utb).registerSwapper(address(swapper));
    }

    function deployDecentBridgeAdapter(
        string memory chain,
        address payable utb,
        address decentRouter
    ) public returns (DecentBridgeAdapter decentBridgeAdapter) {
        bool gasIsEth = gasEthLookup[chain];
        address bridgeToken = gasIsEth ? address(0) : getWeth(chain);

        decentBridgeAdapter = DecentBridgeAdapter(
            payable(
                deployChain(
                    chain,
                    "DecentBridgeAdapter",
                    "DecentBridgeAdapter.sol:DecentBridgeAdapter",
                    abi.encode(gasIsEth, bridgeToken)
                )
            )
        );
        decentBridgeAdapter.setRouter(decentRouter);
        decentBridgeAdapter.setBridgeExecutor(
            address(decentBridgeExecutorLookup[chain])
        );
        decentBridgeAdapterLookup[chain] = decentBridgeAdapter;
        decentBridgeAdapter.setUtb(utb);

        UTB(utb).registerBridge(address(decentBridgeAdapter));
        dump();
    }

    function deployStargateBridgeAdapter(
        string memory chain,
        address payable utb
    ) public returns (StargateBridgeAdapter sgBridgeAdapter) {
        sgBridgeAdapter = StargateBridgeAdapter(
            payable(
                deployChain(
                    chain,
                    "StargateBridgeAdapter",
                    "StargateBridgeAdapter.sol:StargateBridgeAdapter",
                    ""
                )
            )
        );
        sgBridgeAdapter.setRouter(sgComposerLookup[chain]);
        sgBridgeAdapter.setBridgeExecutor(sgComposerLookup[chain]);
        sgBridgeAdapterLookup[chain] = sgBridgeAdapter;
        sgBridgeAdapter.setUtb(utb);
        UTB(utb).registerBridge(address(sgBridgeAdapter));
        dump();
    }

    function deployUTBAndItsComponents(
        string memory chain
    )
        public
        returns (
            UTB utb,
            UTBExecutor utbExecutor,
            UniSwapper swapper,
            DecentEthRouter decentRouter,
            DecentBridgeAdapter decentBridgeAdapter,
            StargateBridgeAdapter sgBridgeAdapter
        )
    {
        return deployUTBAndItsComponents(chain, true);
    }

    function deployUTBAndItsComponents(
        string memory chain,
        bool deployDecentBridge
    )
        public
        returns (
            UTB utb,
            UTBExecutor utbExecutor,
            UniSwapper swapper,
            DecentEthRouter decentRouter,
            DecentBridgeAdapter decentBridgeAdapter,
            StargateBridgeAdapter sgBridgeAdapter
        )
    {
        switchTo(chain);
        utb = deployUTB(chain);
        utbExecutor = deployExecutor(chain, payable(utb));
        deployFeeCollector(chain, payable(utb));
        swapper = deployUniSwapper(chain, payable(utb));

        if (deployDecentBridge) {
            deployDecentBridgeRouterAndRegisterDecentEth(chain);
            addLiquidity(chain, LIQUIDITY);
        }

        decentRouter = routerLookup[chain];
        decentBridgeAdapter = deployDecentBridgeAdapter(
            chain,
            payable(utb),
            address(decentRouter)
        );

        sgBridgeAdapter = deployStargateBridgeAdapter(chain, payable(utb));
    }

    function wireUpXChainUTBSrcToDst(
        string memory src,
        string memory dst
    ) public {
        wireUpXChainUTBSrcToDst(src, dst, true);
    }

    function wireUpXChainUTBSrcToDst(
        string memory src,
        string memory dst,
        bool wireUpDecentBridge
    ) public {
        if (wireUpDecentBridge) {
            wireUpSrcToDstDecentBridge(src, dst);
        }
        switchTo(src);
        decentBridgeAdapterLookup[src].registerRemoteBridgeAdapter(
            chainIdLookup[dst],
            lzIdLookup[dst],
            address(decentBridgeAdapterLookup[dst])
        );
        sgBridgeAdapterLookup[src].registerRemoteBridgeAdapter(
            chainIdLookup[dst],
            lzIdLookup[dst],
            address(sgBridgeAdapterLookup[dst])
        );
    }

    function wireUpXChainUTB(string memory src, string memory dst) public {
        wireUpXChainUTBSrcToDst(src, dst);
        wireUpXChainUTBSrcToDst(dst, src);
    }

    function setupXChainUTBInfra(string memory src, string memory dst) public {
        deployUTBAndItsComponents(src);
        deployUTBAndItsComponents(dst);
        wireUpXChainUTB(src, dst);
    }
}
