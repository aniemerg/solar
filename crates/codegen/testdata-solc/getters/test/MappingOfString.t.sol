// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MappingOfString.sol";

contract MappingOfStringTest {
    MappingOfString c;

    function setUp() public {
        c = new MappingOfString();
    }

    function test_getter() public view {
        assert(c.x("abc", 0) == 1);
        assert(c.x("abc", 1) == 2);
        assert(c.x("abc", 2) == 3);
        assert(c.x("def", 0) == 0);
        assert(c.x("def", 1) == 9);
        assert(c.x("def", 2) == 0);
    }
}
