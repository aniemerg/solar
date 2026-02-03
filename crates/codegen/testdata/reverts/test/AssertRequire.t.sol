// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/AssertRequire.sol";

contract AssertRequireTest is Test {
    AssertRequire c;

    function setUp() public {
        c = new AssertRequire();
    }

    function test_AssertRequire_f() public {
        vm.expectRevert();
        c.f();
    }

    function test_AssertRequire_g() public {
        vm.expectRevert();
        c.g(false);
        assert(c.g(true) == true);
    }

    function test_AssertRequire_h() public {
        vm.expectRevert();
        c.h(false);
        assert(c.h(true) == true);
    }
}
