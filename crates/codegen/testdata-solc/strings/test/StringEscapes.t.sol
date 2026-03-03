// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StringEscapes.sol";

contract StringEscapesTest {
    StringEscapes c;

    function setUp() public {
        c = new StringEscapes();
    }

    function test_StringEscapes() public view {
        bytes32 result = c.f();
        // "\t\n\r\'\"\\": 0x09, 0x0a, 0x0d, 0x27, 0x22, 0x5c, then zeros
        assert(result == 0x090a0d27225c0000000000000000000000000000000000000000000000000000);
    }
}
