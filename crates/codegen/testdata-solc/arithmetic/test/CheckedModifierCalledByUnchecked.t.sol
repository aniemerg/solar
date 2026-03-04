// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/CheckedModifierCalledByUnchecked.sol";

contract CheckedModifierCalledByUncheckedTest is Test {
    CheckedModifierCalledByUnchecked c;

    function setUp() public {
        c = new CheckedModifierCalledByUnchecked();
    }

    function test_CheckedModifierCalledByUnchecked_Valid() public {
        // modifier add(0xe000, 0xe500) runs unchecked (no overflow), body b+c = 0xe500+2 = 58626
        assert(c.f(0xe000, 0xe500, 2) == 58626);
    }

    function test_CheckedModifierCalledByUnchecked_BodyOverflow() public {
        // modifier add(0x1000, 0xe500) runs unchecked (no overflow), body b+c = 0xe500+0xe000 overflows
        vm.expectRevert();
        c.f(0x1000, 0xe500, 0xe000);
    }
}
