// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataStructArrayMember.sol";

contract CalldataStructArrayMemberTest {
    CalldataStructArrayMember c;

    function setUp() public {
        c = new CalldataStructArrayMember();
    }

    function test_CalldataStructArrayMember() public view {
        CalldataStructArrayMember.S memory s;
        s.a = 42;
        s.b[0] = 1;
        s.b[1] = 2;
        s.c = 23;
        (uint256 a, uint256 b0, uint256 b1, uint256 cc) = c.f(s);
        assert(a == 42 && b0 == 1 && b1 == 2 && cc == 23);
    }
}
