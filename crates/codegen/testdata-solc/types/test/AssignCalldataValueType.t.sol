// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AssignCalldataValueType.sol";

contract AssignCalldataValueTypeTest {
    AssignCalldataValueType c;

    function setUp() public {
        c = new AssignCalldataValueType();
    }

    function test_f() public view {
        // f(uint256): 23 -> 42, 23
        (uint256 x, uint256 b) = c.f(23);
        assert(x == 42);
        assert(b == 23);
    }
}
