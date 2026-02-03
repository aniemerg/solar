// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SimpleStructAllocation.sol";

contract SimpleStructAllocationTest {
    SimpleStructAllocation c;

    function setUp() public {
        c = new SimpleStructAllocation();
    }

    function test_SimpleStructAllocation() public view {
        assert(c.f() == 1);
    }
}
