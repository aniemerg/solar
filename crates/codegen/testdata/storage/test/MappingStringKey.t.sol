// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MappingStringKey.sol";

contract MappingStringKeyTest {
    MappingStringKey c;

    function setUp() public {
        c = new MappingStringKey();
    }

    function test_MappingStringKey() public {
        c.set("abc", 8);
        assert(c.get("abc") == 8);
        assert(c.get("abe") == 0);
        assert(c.getFixed() == 0);
        c.setFixed(9);
        assert(c.getFixed() == 9);
    }
}
