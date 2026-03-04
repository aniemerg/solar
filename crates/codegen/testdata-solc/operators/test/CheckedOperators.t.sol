// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/CheckedOperators.sol";

contract CheckedOperatorsTest is Test {
    function test_CheckedOperators() public {
        C c = new C();
        // 250 + 10 = 260 overflows uint8, expect panic 0x11 (arithmetic overflow)
        vm.expectRevert(abi.encodeWithSelector(bytes4(0x4e487b71), 0x11));
        c.checkedOp();

        vm.expectRevert(abi.encodeWithSelector(bytes4(0x4e487b71), 0x11));
        c.checkedOpUnchecked();
    }
}
