// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataStructWithBytesToMemory.sol";

contract CalldataStructWithBytesToMemoryTest {
    CalldataStructWithBytesToMemory c;

    function setUp() public {
        c = new CalldataStructWithBytesToMemory();
    }

    function test_CalldataStructWithBytesToMemory() public view {
        CalldataStructWithBytesToMemory.S memory s;
        s.a = 42;
        s.b = "ab";
        s.c = 23;
        (uint256 a, bytes1 b0, bytes1 b1, uint256 cc) = c.f(s);
        assert(a == 42 && b0 == bytes1("a") && b1 == bytes1("b") && cc == 23);
    }
}
