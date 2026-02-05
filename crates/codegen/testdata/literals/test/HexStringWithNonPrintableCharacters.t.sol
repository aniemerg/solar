// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/HexStringWithNonPrintableCharacters.sol";

contract HexStringWithNonPrintableCharactersTest {
    function test_HexStringWithNonPrintableCharacters() public {
        HexStringWithNonPrintableCharacters c = new HexStringWithNonPrintableCharacters();
        bytes32 out = c.f();
        bytes32 expected = 0x000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
        assert(out == expected);
    }
}
