// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StringConcatDifferentTypes.sol";

contract StringConcatDifferentTypesTest {
    StringConcatDifferentTypes c;

    function setUp() public {
        c = new StringConcatDifferentTypes();
    }

    function test_f() public view {
        string memory long32 = "abcdabcdabcdabcdabcdabcdabcdabcd";
        assert(keccak256(bytes(c.f(long32))) == keccak256(abi.encodePacked(long32, "bcdef")));
    }

    function test_g() public view {
        string memory long32 = "abcdabcdabcdabcdabcdabcdabcdabcd";
        assert(keccak256(bytes(c.g(long32))) == keccak256(abi.encodePacked(long32, "abcdefghabcdefghabcdefghabcdefghab")));
    }

    function test_h() public view {
        string memory long32 = "abcdabcdabcdabcdabcdabcdabcdabcd";
        assert(keccak256(bytes(c.h(long32))) == keccak256(abi.encodePacked(long32, "bcdef")));
    }

    function test_j() public view {
        string memory long32 = "abcdabcdabcdabcdabcdabcdabcdabcd";
        assert(keccak256(bytes(c.j(long32))) == keccak256(abi.encodePacked(long32, "bcdef", "bcdef")));
    }

    function test_k() public view {
        string memory long32 = "abcdabcdabcdabcdabcdabcdabcdabcd";
        assert(keccak256(bytes(c.k(long32, bytes("bcdef")))) == keccak256(abi.encodePacked(long32, "bcdef")));
    }

    function test_slice() public view {
        assert(keccak256(bytes(c.slice("abcd"))) == keccak256(bytes("abcd")));
    }

    function test_strParam() public view {
        string memory long32 = "abcdabcdabcdabcdabcdabcdabcdabcd";
        assert(keccak256(bytes(c.strParam(bytes(long32)))) == keccak256(abi.encodePacked(long32, "bcdef")));
    }
}
