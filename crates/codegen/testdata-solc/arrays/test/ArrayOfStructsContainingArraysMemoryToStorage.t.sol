// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayOfStructsContainingArraysMemoryToStorage.sol";

contract ArrayOfStructsContainingArraysMemoryToStorageTest {
    function test_ArrayOfStructsContainingArraysMemoryToStorage() public {
        ArrayOfStructsContainingArraysMemoryToStorage c = new ArrayOfStructsContainingArraysMemoryToStorage();
        // f() -> 3, 3, 3, 1
        (uint256 a, uint256 b, uint128 cc, uint128 d) = c.f();
        assert(a == 3);
        assert(b == 3);
        assert(cc == 3);
        assert(d == 1);
    }
}
