// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataStructArrayMemberDynamic.sol";

contract CalldataStructArrayMemberDynamicTest {
    CalldataStructArrayMemberDynamic c;

    function setUp() public {
        c = new CalldataStructArrayMemberDynamic();
    }

    function test_CalldataStructArrayMemberDynamic() public view {
        uint256[] memory b = new uint256[](2);
        b[0] = 1;
        b[1] = 2;
        CalldataStructArrayMemberDynamic.S memory s;
        s.a = 42;
        s.b = b;
        s.c = 23;
        (uint32 a, uint256 b0, uint256 b1, uint64 cc) = c.f(s);
        assert(a == 42 && b0 == 1 && b1 == 2 && cc == 23);
    }
}
