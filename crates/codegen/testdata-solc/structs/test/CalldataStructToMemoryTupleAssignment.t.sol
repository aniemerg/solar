// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataStructToMemoryTupleAssignment.sol";

contract CalldataStructToMemoryTupleAssignmentTest {
    CalldataStructToMemoryTupleAssignment c;

    function setUp() public {
        c = new CalldataStructToMemoryTupleAssignment();
    }

    function test_CalldataStructToMemoryTupleAssignment() public {
        // f(55, S{p1:77, a:[[1,2],[_,2]], p2:88}) -> (55, 78, 1, 2, 88)
        uint256[] memory a0 = new uint256[](2);
        a0[0] = 1;
        a0[1] = 2;
        uint256[] memory a1 = new uint256[](2);
        a1[0] = 0;
        a1[1] = 2;
        CalldataStructToMemoryTupleAssignment.S memory s;
        s.p1 = 77;
        s.a[0] = a0;
        s.a[1] = a1;
        s.p2 = 88;
        (uint32 p2out, uint128 p1out, uint256 a00, uint256 a11, uint32 p2s) = c.f(55, s);
        assert(p2out == 55 && p1out == 78 && a00 == 1 && a11 == 2 && p2s == 88);
    }
}
