// SPDX-License-Identifier: MIT
pragma solidity ^0.8.32;

import "../src/StorageBoundaryArrayPartialAssignment.sol";

contract StorageBoundaryArrayPartialAssignmentTest {
    StorageBoundaryArrayPartialAssignment c;

    function setUp() public {
        c = new StorageBoundaryArrayPartialAssignment();
    }

    function test_StorageBoundaryArrayPartialAssignment() public {
        uint256[10] memory init = c.x();
        for (uint256 i = 0; i < 10; i++) assert(init[i] == 0);

        c.fillArray();
        uint256[10] memory filled = c.x();
        assert(filled[0] == 0);
        for (uint256 i = 1; i < 10; i++) assert(filled[i] == i);

        c.partialAssignArrayCrossStorageBoundary();
        uint256[10] memory cross = c.x();
        assert(cross[0] == 11 && cross[1] == 12 && cross[2] == 13 && cross[3] == 14);
        assert(cross[4] == 15 && cross[5] == 16 && cross[6] == 17);
        assert(cross[7] == 0 && cross[8] == 0 && cross[9] == 0);

        c.partialAssignArrayBeforeStorageBoundary();
        uint256[10] memory p2 = c.x();
        assert(p2[0] == 21 && p2[1] == 22 && p2[2] == 23);
        for (uint256 i = 3; i < 10; i++) assert(p2[i] == 0);
    }
}
