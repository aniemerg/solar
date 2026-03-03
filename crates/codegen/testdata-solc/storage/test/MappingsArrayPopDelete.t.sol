// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MappingsArrayPopDelete.sol";

contract MappingsArrayPopDeleteTest {
    MappingsArrayPopDelete c;

    function setUp() public {
        c = new MappingsArrayPopDelete();
    }

    function test_MappingsArrayPopDelete() public {
        c.n1(42, 64);
        assert(c.map(42) == 64);
        c.p();
        c.n2();
        // After pop+push, same slot reused; mapping data (key 42 -> 64) persists
        assert(c.map(42) == 64);
        uint len = c.d();
        assert(len == 0);
        c.n2();
        // After delete+push, same slot reused; mapping data still persists in storage
        assert(c.map(42) == 64);
    }
}
