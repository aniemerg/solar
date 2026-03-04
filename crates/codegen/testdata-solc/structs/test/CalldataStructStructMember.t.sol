// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataStructStructMember.sol";

contract CalldataStructStructMemberTest {
    CalldataStructStructMember c;

    function setUp() public {
        c = new CalldataStructStructMember();
    }

    function test_CalldataStructStructMember() public view {
        CalldataStructStructMember.S1 memory s1;
        s1.a = 42;
        s1.s.a = 1;
        s1.s.b = 2;
        s1.c = 23;
        (uint256 a, uint64 b0, uint64 b1, uint256 cc) = c.f(s1);
        assert(a == 42 && b0 == 1 && b1 == 2 && cc == 23);
    }
}
