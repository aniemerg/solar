// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConvertFixedBytesToUintSmallerSize.sol";

contract ConvertFixedBytesToUintSmallerSizeTest {
    ConvertFixedBytesToUintSmallerSize c;

    function setUp() public {
        c = new ConvertFixedBytesToUintSmallerSize();
    }

    function test_bytesToUint() public view {
        // bytesToUint(bytes4): "abcd" -> 0x6364 (last 2 bytes of uint32)
        uint16 result = c.bytesToUint(bytes4("abcd"));
        assert(result == 0x6364);
    }
}
