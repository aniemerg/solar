// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataStruct.sol";

contract CalldataStructTest {
    CalldataStruct c;

    function setUp() public {
        c = new CalldataStruct();
    }

    function test_CalldataStruct() public view {
        CalldataStruct.S memory s;
        s.a = 42;
        s.b = 23;
        (uint256 a, uint256 b) = c.f(s);
        assert(a == 42 && b == 23);
    }
}
