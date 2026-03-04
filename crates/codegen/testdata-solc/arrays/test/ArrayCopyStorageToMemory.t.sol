// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyStorageToMemory.sol";

contract ArrayCopyStorageToMemoryTest {
    function test_ArrayCopyStorageToMemory() public {
        ArrayCopyStorageToMemory c = new ArrayCopyStorageToMemory();
        // f() -> 1, 3
        (uint a, uint b) = c.f();
        assert(a == 1);
        assert(b == 3);
    }
}
