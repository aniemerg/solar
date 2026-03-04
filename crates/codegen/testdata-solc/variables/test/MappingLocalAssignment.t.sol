// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MappingLocalAssignment.sol";

contract MappingLocalAssignmentTest {
    function test_MappingLocalAssignment() public {
        MappingLocalAssignment c = new MappingLocalAssignment();
        (uint8 a, uint8 b, uint8 cc, uint8 d) = c.f();
        assert(a == 42);
        assert(b == 0);
        assert(cc == 0);
        assert(d == 21);
    }
}
