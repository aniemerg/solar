// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/DestructuringAssignment.sol";

contract DestructuringAssignmentTest {
    DestructuringAssignment c;

    function setUp() public {
        c = new DestructuringAssignment();
    }

    function test_f() public {
        assert(c.f("abcde") == 0);
    }
}
