// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "../src/StorageMemoryNestedBytes.sol";

contract StorageMemoryNestedBytesTest {
    function test_StorageMemoryNestedBytes() public {
        StorageMemoryNestedBytes c = new StorageMemoryNestedBytes();
        bytes[] memory result = c.f();
        assert(result.length == 2);
        assert(result[0].length == 3);
        assert(keccak256(result[0]) == keccak256(bytes("abc")));
        assert(result[1].length == 0x99);
        assert(keccak256(result[1]) == keccak256(bytes("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVXYZ")));
    }
}
