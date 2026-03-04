// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StorageMemoryPackedDyn.sol";

contract StorageMemoryPackedDynTest {
    function test_StorageMemoryPackedDyn() public {
        StorageMemoryPackedDyn c = new StorageMemoryPackedDyn();
        // f() -> 2, 3, 4
        (uint8 v0, uint8 v1, uint8 v2) = c.f();
        assert(v0 == 2);
        assert(v1 == 3);
        assert(v2 == 4);
    }
}
