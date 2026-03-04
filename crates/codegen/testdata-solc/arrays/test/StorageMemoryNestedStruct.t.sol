// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StorageMemoryNestedStruct.sol";

contract StorageMemoryNestedStructTest {
    function test_StorageMemoryNestedStruct() public {
        StorageMemoryNestedStruct c = new StorageMemoryNestedStruct();
        // f() -> 11, 0x0c, 1, 0x15, 22, 4
        (uint8 v0, uint8 v1, uint v2, uint8 v3, uint8 v4, uint v5) = c.f();
        assert(v0 == 11);
        assert(v1 == 12);
        assert(v2 == 1);
        assert(v3 == 21);
        assert(v4 == 22);
        assert(v5 == 4);
    }
}
