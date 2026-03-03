// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StringConcatNested.sol";

contract StringConcatNestedTest {
    StringConcatNested c;

    function setUp() public {
        c = new StringConcatNested();
    }

    function test_StringConcatNested() public view {
        // f("ab","ab","ab") -> "ababab"
        assert(keccak256(bytes(c.f("ab", "ab", "ab"))) == keccak256(bytes("ababab")));
        assert(keccak256(bytes(c.f("", "", ""))) == keccak256(bytes("")));
        assert(keccak256(bytes(c.f("hello", " ", "world"))) == keccak256(bytes("hello world")));
    }
}
