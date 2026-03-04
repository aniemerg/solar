// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MappingArrayInternalArgument.sol";

contract MappingArrayInternalArgumentTest {
    MappingArrayInternalArgument c;

    function setUp() public {
        c = new MappingArrayInternalArgument();
    }

    function test_set_returns_old_values_initially_zero() public {
        (uint8 a1, uint8 a2, uint8 b1, uint8 b2) = c.set(1, 21, 22, 42, 43);
        assert(a1 == 0);
        assert(a2 == 0);
        assert(b1 == 0);
        assert(b2 == 0);
    }

    function test_get_returns_set_values() public {
        c.set(1, 21, 22, 42, 43);
        (uint8 a1, uint8 a2, uint8 b1, uint8 b2) = c.get(1);
        assert(a1 == 21);
        assert(a2 == 22);
        assert(b1 == 42);
        assert(b2 == 43);
    }

    function test_set_returns_old_values_then_overwrites() public {
        c.set(1, 21, 22, 42, 43);
        (uint8 a1, uint8 a2, uint8 b1, uint8 b2) = c.set(1, 10, 30, 11, 31);
        assert(a1 == 21);
        assert(a2 == 22);
        assert(b1 == 42);
        assert(b2 == 43);
        (uint8 ga1, uint8 ga2, uint8 gb1, uint8 gb2) = c.get(1);
        assert(ga1 == 10);
        assert(ga2 == 30);
        assert(gb1 == 11);
        assert(gb2 == 31);
    }
}
