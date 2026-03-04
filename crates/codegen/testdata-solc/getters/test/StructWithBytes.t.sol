// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructWithBytes.sol";

contract StructWithBytesTest {
    StructWithBytes c;

    function setUp() public {
        c = new StructWithBytes();
    }

    function test_getter() public view {
        // s() -> 7, offset, length=3, "abc..."
        // Mapping and dynamic array fields are excluded from getter
        (uint a, bytes memory b) = c.s();
        assert(a == 7);
        assert(b.length == 3);
        assert(b[0] == 0x61); // 'a'
        assert(b[1] == 0x62); // 'b'
        assert(b[2] == 0x63); // 'c'
    }
}
