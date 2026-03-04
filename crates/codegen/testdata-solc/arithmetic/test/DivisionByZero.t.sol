// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/DivisionByZero.sol";

contract DivisionByZeroTest is Test {
    DivisionByZero c;

    function setUp() public {
        c = new DivisionByZero();
    }

    function test_DivisionByZero_div_Valid() public view {
        assert(c.div(7, 2) == 3);
    }

    function test_DivisionByZero_div_Zero() public {
        vm.expectRevert();
        c.div(7, 0);
    }

    function test_DivisionByZero_mod_Valid() public view {
        assert(c.mod(7, 2) == 1);
    }

    function test_DivisionByZero_mod_Zero() public {
        vm.expectRevert();
        c.mod(7, 0);
    }
}
