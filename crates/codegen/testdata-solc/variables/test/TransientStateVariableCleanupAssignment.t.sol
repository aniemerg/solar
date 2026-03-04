// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../src/TransientStateVariableCleanupAssignment.sol";

contract TransientStateVariableCleanupAssignmentTest {
    function test_TransientStateVariableCleanupAssignment() public {
        TransientStateVariableCleanupAssignment c = new TransientStateVariableCleanupAssignment();
        // uint8 truncation: 0xFFFF -> 0xFF, stored in transient slot
        assert(c.f() == 0xff);
    }
}
