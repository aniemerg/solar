// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BytesMemoryToStorage.sol";

contract BytesMemoryToStorageTest {
    function test_BytesMemoryToStorage() public {
        BytesMemoryToStorage c = new BytesMemoryToStorage();
        // f() -> "a"
        assert(c.f() == bytes1("a"));
    }
}
