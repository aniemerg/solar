// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataStructAndInts.sol";

contract CalldataStructAndIntsTest {
    CalldataStructAndInts c;

    function setUp() public {
        c = new CalldataStructAndInts();
    }

    function test_CalldataStructAndInts() public view {
        CalldataStructAndInts.S memory s;
        s.a = 2;
        s.b = 3;
        (uint256 a, uint256 sa, uint256 sb, uint256 b) = c.f(1, s, 4);
        assert(a == 1 && sa == 2 && sb == 3 && b == 4);
    }
}
