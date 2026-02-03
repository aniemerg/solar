// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/UncheckedDivByZero.sol";

contract UncheckedDivByZeroTest is Test {
    UncheckedDivByZero c;

    function setUp() public {
        c = new UncheckedDivByZero();
    }

    function test_UncheckedDivByZero_Valid() public view {
        assert(c.div(7, 2) == 3);
        assert(c.mod(7, 2) == 1);
    }

    function test_UncheckedDivByZero_DivZero() public {
        vm.expectRevert();
        c.div(7, 0);
    }

    function test_UncheckedDivByZero_ModZero() public {
        vm.expectRevert();
        c.mod(7, 0);
    }
}
