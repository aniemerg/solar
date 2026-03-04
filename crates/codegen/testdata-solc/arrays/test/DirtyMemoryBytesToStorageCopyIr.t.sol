// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/DirtyMemoryBytesToStorageCopyIr.sol";

contract DirtyMemoryBytesToStorageCopyIrTest {
    function test_DirtyMemoryBytesToStorageCopyIr() public {
        DirtyMemoryBytesToStorageCopyIr c = new DirtyMemoryBytesToStorageCopyIr();
        // f() -> 0x6465616462656566000000000000000000000000000000000000000000000010
        // The storage slot contains: "deadbeef" (8 bytes) stored in short bytes format
        // Short bytes format: data | (length * 2)
        // length=8 -> 0x10, data = "deadbeef" = 0x6465616462656566
        uint r = c.f();
        assert(r == 0x6465616462656566000000000000000000000000000000000000000000000010);
    }
}
