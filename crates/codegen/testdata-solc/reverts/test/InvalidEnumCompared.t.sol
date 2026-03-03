// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/InvalidEnumCompared.sol";

contract InvalidEnumComparedTest is Test {
    InvalidEnumCompared c;

    function setUp() public {
        c = new InvalidEnumCompared();
    }

    function test_eq_ok() public {
        assert(c.run_eq_ok() == true);
    }

    function test_eq() public {
        // Comparing invalid enum triggers Panic(0x21)
        vm.expectRevert();
        c.run_eq();
    }

    function test_neq() public {
        // Comparing invalid enum triggers Panic(0x21)
        vm.expectRevert();
        c.run_neq();
    }
}
