// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/SignedMod.sol";

contract SignedModTest is Test {
    SignedMod c;

    function setUp() public {
        c = new SignedMod();
    }

    function test_SignedMod_f() public view {
        assert(c.f(7, 5) == 2);
        assert(c.f(7, -5) == 2);
        assert(c.f(-7, 5) == -2);
        assert(c.f(-5, -5) == 0);
    }

    function test_SignedMod_g_Overflow() public {
        // type(int).min / -1 overflows
        vm.expectRevert();
        c.g(true);
    }

    function test_SignedMod_g_Unchecked() public view {
        // unchecked type(int).min / -1 wraps
        assert(c.g(false) == type(int256).min);
    }
}
