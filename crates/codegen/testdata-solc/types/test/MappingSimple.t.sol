// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MappingSimple.sol";

contract MappingSimpleTest {
    MappingSimple c;

    function setUp() public {
        c = new MappingSimple();
    }

    function test_mapping_operations() public {
        assert(c.get(0) == 0);
        assert(c.get(1) == 0);
        assert(c.get(0xa7) == 0);

        c.set(0x01, 0xa1);
        assert(c.get(0) == 0);
        assert(c.get(0x01) == 0xa1);
        assert(c.get(0xa7) == 0);

        c.set(0x00, 0xef);
        assert(c.get(0) == 0xef);
        assert(c.get(0x01) == 0xa1);
        assert(c.get(0xa7) == 0);

        c.set(0x01, 0x05);
        assert(c.get(0) == 0xef);
        assert(c.get(0x01) == 0x05);
        assert(c.get(0xa7) == 0);
    }
}
