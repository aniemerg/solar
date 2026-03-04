// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructWithBytesSimple.sol";

contract StructWithBytesSimpleTest {
    StructWithBytesSimple c;

    function setUp() public {
        c = new StructWithBytesSimple();
    }

    function test_getter() public view {
        // s() -> 7, offset(0x40), "abc" (length=3)
        // Mapping and dynamic array fields are excluded from getter return
        (uint a, bytes memory b) = c.s();
        assert(a == 7);
        assert(b.length == 3);
        assert(b[0] == 0x61); // 'a'
        assert(b[1] == 0x62); // 'b'
        assert(b[2] == 0x63); // 'c'
    }
}
