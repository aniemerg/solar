// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MappingLocalCompoundAssignment.sol";

contract MappingLocalCompoundAssignmentTest {
    function test_MappingLocalCompoundAssignment() public {
        MappingLocalCompoundAssignment c = new MappingLocalCompoundAssignment();
        (uint8 a, uint8 b, uint8 cc, uint8 d) = c.f();
        assert(a == 42);
        assert(b == 0);
        assert(cc == 0);
        assert(d == 21);
    }
}
