pragma solidity ^0.8.0;

import {XChainDecentBridgeActions} from "./XChainDecentBridgeActions.sol";
import {Test} from "forge-std/Test.sol";
import {ERC20} from "solmate/tokens/ERC20.sol";
import {console2} from "forge-std/console2.sol";

contract UTBCommonAssertions is XChainDecentBridgeActions, Test {
    function assertNoMoneyInContract(
        string memory chain,
        address target
    ) private {
        switchTo(chain);
        assertEq(target.balance, 0);
        assertEq(wethBalance(chain, target), 0);
        assertEq(usdcBalance(chain, target), 0);
    }

    function assertFees(string memory src) private {
        switchTo(src);
        address feeCollector = address(feeCollectorLookup[src]);
        if (feeToken == address(0)) {
            assertEq(feeCollector.balance, feeAmount);
        } else {
            assertEq(ERC20(feeToken).balanceOf(feeCollector), feeAmount);
        }
    }

    function assertNoMoneyInDecentContractsAndCollectedFees(
        string memory src,
        string memory dst
    ) public {
        assertNoMoneyInContract(src, address(swapperLookup[src]));
        assertNoMoneyInContract(src, address(utbLookup[src]));

        assertNoMoneyInContract(dst, address(swapperLookup[dst]));
        assertNoMoneyInContract(dst, address(utbLookup[dst]));

        assertFees(src);
    }
}
