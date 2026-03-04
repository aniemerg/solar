// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StorageMemoryNestedFromPointer.sol";

contract StorageMemoryNestedFromPointerTest {
    function test_StorageMemoryNestedFromPointer() public {
        StorageMemoryNestedFromPointer c = new StorageMemoryNestedFromPointer();
        // f() -> 1, 2, 3, 4, 5, 6, 7
        (uint72 v0, uint72 v1, uint72 v2, uint72 v3, uint72 v4, uint72 v5, uint72 v6) = c.f();
        assert(v0 == 1);
        assert(v1 == 2);
        assert(v2 == 3);
        assert(v3 == 4);
        assert(v4 == 5);
        assert(v5 == 6);
        assert(v6 == 7);
    }
}
