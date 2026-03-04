// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MemoryToStorageDifferentBase.sol";

contract MemoryToStorageDifferentBaseTest {
    function test_MemoryToStorageDifferentBase() public {
        MemoryToStorageDifferentBase c = new MemoryToStorageDifferentBase();
        // f() -> 3, "abcd", "bcde", "cdef"
        (uint256 len, bytes10 a, bytes10 b, bytes10 cc) = c.f();
        assert(len == 3);
        assert(a == bytes10(bytes4("abcd")));
        assert(b == bytes10(bytes4("bcde")));
        assert(cc == bytes10(bytes4("cdef")));
    }
}
