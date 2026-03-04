// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MappingToStruct.sol";

contract MappingToStructTest {
    MappingToStruct c;

    function setUp() public {
        c = new MappingToStruct();
    }

    function test_getter() public view {
        (uint8 a, uint16 b, uint128 cv, uint d) = c.x(1, 2);
        assert(a == 3);
        assert(b == 4);
        assert(cv == 5);
        assert(d == 6);

        (uint8 a2, uint16 b2, uint128 c2, uint d2) = c.x(0, 0);
        assert(a2 == 0);
        assert(b2 == 0);
        assert(c2 == 0);
        assert(d2 == 0);
    }
}
