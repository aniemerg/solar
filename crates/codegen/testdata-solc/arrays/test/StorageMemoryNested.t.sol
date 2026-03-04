// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StorageMemoryNested.sol";

contract StorageMemoryNestedTest {
    function test_StorageMemoryNested() public {
        StorageMemoryNested c = new StorageMemoryNested();
        // f() -> 1, 2, 3, 4, 5, 6, 7
        (uint72 a, uint72 b, uint72 cc, uint72 d, uint72 e, uint72 f, uint72 g) = c.f();
        assert(a == 1);
        assert(b == 2);
        assert(cc == 3);
        assert(d == 4);
        assert(e == 5);
        assert(f == 6);
        assert(g == 7);
    }
}
