// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/InvalidInstruction.sol";

contract InvalidInstructionTest is Test {
    InvalidInstruction c;

    function setUp() public {
        c = new InvalidInstruction();
    }

    function test_f() public {
        vm.expectRevert();
        c.f();
    }
}
