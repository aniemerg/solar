// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayMappingStruct.sol";

contract ArrayMappingStructTest {
    ArrayMappingStruct c;

    function setUp() public {
        c = new ArrayMappingStruct();
    }

    function test_m_getters() public view {
        (uint a, uint b) = c.m(0, 0);
        assert(a == 0 && b == 0);

        (a, b) = c.m(1, 0);
        assert(a == 1 && b == 2);

        (a, b) = c.m(1, 1);
        assert(a == 3 && b == 4);

        (a, b) = c.m(1, 2);
        assert(a == 0 && b == 0);
    }

    function test_n_getters() public view {
        (uint a, uint b) = c.n(0, 0);
        assert(a == 0 && b == 0);

        (a, b) = c.n(1, 0);
        assert(a == 7 && b == 8);

        (a, b) = c.n(1, 1);
        assert(a == 9 && b == 10);

        (a, b) = c.n(1, 2);
        assert(a == 0 && b == 0);
    }
}
