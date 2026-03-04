// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/UncheckedCalledByChecked.sol";

contract UncheckedCalledByCheckedTest is Test {
    UncheckedCalledByChecked c;

    function setUp() public {
        c = new UncheckedCalledByChecked();
    }

    function test_UncheckedCalledByChecked_Valid() public view {
        // add(7, 0x100) unchecked = 0x107, then checked + 0x100 = 0x207
        assert(c.f(7) == 0x0207);
        // add(0xffff, 0x100) unchecked wraps to 0xff, then checked + 0x100 = 0x1ff = 511
        assert(c.f(0xffff) == 511);
    }

    function test_UncheckedCalledByChecked_Overflow() public {
        // add(0xfeff, 0x100) unchecked = 0xffff, then checked + 0x100 overflows
        vm.expectRevert();
        c.f(0xfeff);
    }
}
