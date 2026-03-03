// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StringConcat2Args.sol";

contract StringConcat2ArgsTest {
    StringConcat2Args c;

    function setUp() public {
        c = new StringConcat2Args();
    }

    function test_StringConcat2Args() public view {
        assert(keccak256(bytes(c.f("abc", "def"))) == keccak256(bytes("abcdef")));
        assert(keccak256(bytes(c.f("", "abc"))) == keccak256(bytes("abc")));
        assert(keccak256(bytes(c.f("abc", ""))) == keccak256(bytes("abc")));
        assert(keccak256(bytes(c.f("", ""))) == keccak256(bytes("")));
        string memory long32 = "abcdabcdabcdabcdabcdabcdabcdabcd";
        assert(keccak256(bytes(c.f(long32, "bcdef"))) == keccak256(abi.encodePacked(long32, "bcdef")));
    }
}
