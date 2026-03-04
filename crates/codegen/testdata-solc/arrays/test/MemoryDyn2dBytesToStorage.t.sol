// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MemoryDyn2dBytesToStorage.sol";

contract MemoryDyn2dBytesToStorageTest {
    function test_MemoryDyn2dBytesToStorage() public {
        MemoryDyn2dBytesToStorage c = new MemoryDyn2dBytesToStorage();
        // f() -> 3
        assert(c.f() == 3);
    }
}
