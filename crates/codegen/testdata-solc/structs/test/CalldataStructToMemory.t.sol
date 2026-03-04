// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataStructToMemory.sol";

contract CalldataStructToMemoryTest {
    CalldataStructToMemory c;

    function setUp() public {
        c = new CalldataStructToMemory();
    }

    function test_CalldataStructToMemory() public view {
        CalldataStructToMemory.S memory s;
        s.a = 42;
        s.b = 23;
        s.c = "ab";
        (uint256 a, uint256 b, bytes1 cb) = c.f(s);
        assert(a == 42 && b == 23 && cb == bytes1("b"));
    }
}
