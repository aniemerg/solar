// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StaticMemoryArrayAllocation.sol";

contract StaticMemoryArrayAllocationTest {
    function test_StaticMemoryArrayAllocation() public {
        StaticMemoryArrayAllocation c = new StaticMemoryArrayAllocation();
        // withValue() -> 0x00  (assignment of static array is a pointer copy, no allocation)
        assert(c.withValue() == 0x00);
        // withoutValue() -> 0x0280  (declaration without value allocates 20*32=640=0x280 bytes)
        assert(c.withoutValue() == 0x0280);
    }
}
