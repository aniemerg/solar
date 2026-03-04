// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayOfStructMemoryToStorage.sol";

contract ArrayOfStructMemoryToStorageTest {
    function test_ArrayOfStructMemoryToStorage() public {
        ArrayOfStructMemoryToStorage c = new ArrayOfStructMemoryToStorage();
        // f() -> 10, 11, 12
        (uint128 a, uint64 b, uint128 cc) = c.f();
        assert(a == 10);
        assert(b == 11);
        assert(cc == 12);
    }
}
