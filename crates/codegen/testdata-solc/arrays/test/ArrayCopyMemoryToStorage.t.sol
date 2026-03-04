// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyMemoryToStorage.sol";

contract ArrayCopyMemoryToStorageTest {
    function test_ArrayCopyMemoryToStorage() public {
        ArrayCopyMemoryToStorage c = new ArrayCopyMemoryToStorage();
        // f() -> 1, 3
        (uint32 fa, uint256 fb) = c.f();
        assert(fa == 1);
        assert(fb == 3);
        // g() -> 1, 2, 3
        (uint32 ga, uint32 gb, uint32 gc) = c.g();
        assert(ga == 1);
        assert(gb == 2);
        assert(gc == 3);
    }
}
