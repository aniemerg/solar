// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataBytesToStorage.sol";

contract CalldataBytesToStorageTest {
    function test_CalldataBytesToStorage() public {
        CalldataBytesToStorage c = new CalldataBytesToStorage();
        // f(bytes): 0x20, 0x08, "abcdefgh" -> "a"
        bytes memory inp = "abcdefgh";
        bytes1 result = c.f(inp);
        assert(result == bytes1("a"));
    }
}
