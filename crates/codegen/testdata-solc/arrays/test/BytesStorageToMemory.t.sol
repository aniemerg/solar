// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BytesStorageToMemory.sol";

contract BytesStorageToMemoryTest {
    function test_BytesStorageToMemory() public {
        BytesStorageToMemory c = new BytesStorageToMemory();
        // f() -> "a"
        assert(c.f() == bytes1("a"));
    }
}
