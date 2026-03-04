// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/NestedStructAllocation.sol";

contract NestedStructAllocationTest {
    NestedStructAllocation c;

    function setUp() public {
        c = new NestedStructAllocation();
    }

    function test_NestedStructAllocation() public view {
        assert(c.f() == 1);
    }
}
