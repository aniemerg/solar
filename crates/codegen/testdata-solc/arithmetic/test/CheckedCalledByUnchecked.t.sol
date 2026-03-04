// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/CheckedCalledByUnchecked.sol";

contract CheckedCalledByUncheckedTest is Test {
    CheckedCalledByUnchecked c;

    function setUp() public {
        c = new CheckedCalledByUnchecked();
    }

    function test_CheckedCalledByUnchecked_Overflow() public {
        // add(0xe000, 0xe500) overflows uint16 inside checked add() even though f() is unchecked
        vm.expectRevert();
        c.f(0xe000, 0xe500, 2);
    }

    function test_CheckedCalledByUnchecked_Wrap() public view {
        // add(0xe000, 0x1000) = 0xf000, then unchecked + 0x1000 wraps to 0x00
        assert(c.f(0xe000, 0x1000, 0x1000) == 0x00);
    }
}
