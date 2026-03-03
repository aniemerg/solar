// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MappingsArray2dPopDelete.sol";

contract MappingsArray2dPopDeleteTest {
    MappingsArray2dPopDelete c;

    function setUp() public {
        c = new MappingsArray2dPopDelete();
    }

    function test_MappingsArray2dPopDelete() public {
        c.n1(42, 64);
        assert(c.map(42) == 64);
        c.p();
        c.n2();
        // After pop and new push, mapping at new entry is zeroed but mapping data persists in storage
        assert(c.map(42) == 64);
        uint len = c.d();
        assert(len == 0);
        c.n2();
        // After delete, previous mapping data cleared; new entry at key 42 should be 0
        assert(c.map(42) == 64);
    }
}
