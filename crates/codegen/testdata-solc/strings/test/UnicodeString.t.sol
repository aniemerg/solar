// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UnicodeString.sol";

contract UnicodeStringTest {
    UnicodeString c;

    function setUp() public {
        c = new UnicodeString();
    }

    function test_UnicodeString() public view {
        // "😃, 😭, and 😈" = 0x14 = 20 bytes
        // f0 9f 98 83 2c 20 f0 9f 98 ad 2c 20 61 6e 64 20 f0 9f 98 88
        bytes memory expected = abi.encodePacked(
            hex"f09f9883", bytes(", "), hex"f09f98ad", bytes(", and "), hex"f09f9888"
        );
        assert(keccak256(bytes(c.f())) == keccak256(expected));
        assert(keccak256(bytes(c.g())) == keccak256(expected));
    }
}
