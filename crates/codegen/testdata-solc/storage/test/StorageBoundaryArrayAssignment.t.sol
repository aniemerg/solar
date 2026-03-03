// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StorageBoundaryArrayAssignment.sol";

contract StorageBoundaryArrayAssignmentTest {
    StorageBoundaryArrayAssignment c;

    function setUp() public {
        c = new StorageBoundaryArrayAssignment();
    }

    function test_StorageBoundaryArrayAssignment() public {
        uint256[10] memory initial = c.x();
        for (uint256 i = 0; i < 10; i++) assert(initial[i] == 0);

        uint256[10] memory arr1 = [uint256(1), 2, 3, 4, 5, 6, 7, 8, 9, 10];
        c.assignArray(arr1);
        uint256[10] memory r1 = c.x();
        for (uint256 i = 0; i < 10; i++) assert(r1[i] == i + 1);

        uint256[10] memory arr2 = [uint256(10), 20, 30, 40, 50, 60, 70, 80, 90, 100];
        c.assignArray(arr2);
        uint256[10] memory r2 = c.x();
        assert(r2[0] == 10 && r2[9] == 100);
    }
}
