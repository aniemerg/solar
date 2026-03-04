// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MappingInternalArgument.sol";

contract MappingInternalArgumentTest {
    MappingInternalArgument c;

    function setUp() public {
        c = new MappingInternalArgument();
    }

    function test_set_initially_zero() public {
        (uint8 old_a, uint8 old_b) = c.set(1, 21, 42);
        assert(old_a == 0);
        assert(old_b == 0);
    }

    function test_get_returns_set_values() public {
        c.set(1, 21, 42);
        (uint8 va, uint8 vb) = c.get(1);
        assert(va == 21);
        assert(vb == 42);
    }

    function test_set_returns_old_values() public {
        c.set(1, 21, 42);
        (uint8 old_a, uint8 old_b) = c.set(1, 10, 11);
        assert(old_a == 21);
        assert(old_b == 42);
        (uint8 va, uint8 vb) = c.get(1);
        assert(va == 10);
        assert(vb == 11);
    }
}
