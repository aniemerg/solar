// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UnicodeEscapes.sol";

contract UnicodeEscapesTest {
    UnicodeEscapes c;

    function setUp() public {
        c = new UnicodeEscapes();
    }

    function test_oneByteUTF8() public view {
        // \u0024 is '$' (0x24), one byte in UTF-8 -> "aaa$aaa" = 7 bytes
        assert(bytes(c.oneByteUTF8()).length == 7);
        assert(keccak256(bytes(c.oneByteUTF8())) == keccak256(bytes("aaa$aaa")));
    }

    function test_twoBytesUTF8() public view {
        // \u00A2 is '¢', two bytes in UTF-8 (0xC2 0xA2) -> "aaa" + 2 bytes + "aaa" = 8 bytes
        assert(bytes(c.twoBytesUTF8()).length == 8);
        assert(keccak256(bytes(c.twoBytesUTF8())) == keccak256(abi.encodePacked("aaa", hex"c2a2", "aaa")));
    }

    function test_threeBytesUTF8() public view {
        // \u20AC is '€', three bytes in UTF-8 (0xE2 0x82 0xAC) -> "aaa" + 3 bytes + "aaa" = 9 bytes
        assert(bytes(c.threeBytesUTF8()).length == 9);
        assert(keccak256(bytes(c.threeBytesUTF8())) == keccak256(abi.encodePacked("aaa", hex"e282ac", "aaa")));
    }

    function test_combined() public view {
        // '$' (1) + '¢' (2) + '€' (3) = 6 bytes
        assert(bytes(c.combined()).length == 6);
        assert(keccak256(bytes(c.combined())) == keccak256(abi.encodePacked(hex"24", hex"c2a2", hex"e282ac")));
    }
}
