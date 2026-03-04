// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataStructStructMemberDynamic.sol";

contract CalldataStructStructMemberDynamicTest {
    CalldataStructStructMemberDynamic c;

    function setUp() public {
        c = new CalldataStructStructMemberDynamic();
    }

    function test_CalldataStructStructMemberDynamic() public view {
        CalldataStructStructMemberDynamic.S1 memory s1;
        s1.a = 42;
        s1.s.a = 1;
        s1.s.b = "ab";
        s1.c = 23;
        (uint256 a, uint64 b0, bytes1 b1, uint256 cc) = c.f(s1);
        assert(a == 42 && b0 == 1 && b1 == bytes1("a") && cc == 23);
    }
}
