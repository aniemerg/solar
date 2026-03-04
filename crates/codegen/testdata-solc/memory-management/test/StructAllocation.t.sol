// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructAllocation.sol";

contract StructAllocationTest {
    function test_StructAllocation() public {
        StructAllocation c = new StructAllocation();
        // withValue() -> 0x00  (assignment of struct pointer, no allocation)
        assert(c.withValue() == 0x00);
        // withoutValue() -> 0x60  (declaration allocates 3*32=96=0x60 bytes)
        assert(c.withoutValue() == 0x60);
    }
}
