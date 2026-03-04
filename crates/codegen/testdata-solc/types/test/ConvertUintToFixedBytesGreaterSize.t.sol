// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConvertUintToFixedBytesGreaterSize.sol";

contract ConvertUintToFixedBytesGreaterSizeTest {
    ConvertUintToFixedBytesGreaterSize c;

    function setUp() public {
        c = new ConvertUintToFixedBytesGreaterSize();
    }

    function test_UintToBytes() public view {
        // UintToBytes(uint16): 0x6162 -> "\x00\x00\x00\x00\x00\x00ab"
        // uint64(0x6162) = 0x0000000000006162, stored as bytes8 big-endian
        bytes8 result = c.UintToBytes(0x6162);
        assert(result == bytes8(uint64(0x6162)));
        // Verify first 6 bytes are zero and last 2 are 'a','b'
        assert(result[6] == 0x61);
        assert(result[7] == 0x62);
    }
}
