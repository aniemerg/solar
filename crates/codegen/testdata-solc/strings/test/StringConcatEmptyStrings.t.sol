// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StringConcatEmptyStrings.sol";

contract StringConcatEmptyStringsTest {
    StringConcatEmptyStrings c;

    function setUp() public {
        c = new StringConcatEmptyStrings();
    }

    function test_StringConcatEmptyStrings() public view {
        assert(bytes(c.f()).length == 0);
        assert(keccak256(bytes(c.g())) == keccak256(bytes("abcabc")));
        assert(keccak256(bytes(c.h())) == keccak256(bytes("abcabc")));
    }
}
