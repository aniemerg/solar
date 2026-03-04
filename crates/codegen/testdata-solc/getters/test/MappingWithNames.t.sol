// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MappingWithNames.sol";

contract MappingWithNamesTest {
    MappingWithNames c;

    function setUp() public {
        c = new MappingWithNames();
    }

    function test_getter() public view {
        assert(c.x(1, 2) == 3);
        assert(c.x(0, 0) == 0);
    }
}
