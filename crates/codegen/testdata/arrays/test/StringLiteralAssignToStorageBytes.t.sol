// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StringLiteralAssignToStorageBytes.sol";

contract StringLiteralAssignToStorageBytesTest {
    StringLiteralAssignToStorageBytes c;

    function setUp() public {
        c = new StringLiteralAssignToStorageBytes();
    }

    function test_StringLiteralAssignToStorageBytes() public {
        assert(keccak256(c.s()) == keccak256(bytes("abc")));
        assert(keccak256(c.s1()) == keccak256(bytes("abcd")));

        c.f();
        assert(keccak256(c.s()) == keccak256(bytes("abcd")));
        assert(keccak256(c.s1()) == keccak256(bytes("abc")));

        c.g();
        assert(keccak256(c.s()) == keccak256(bytes("abc")));
        assert(keccak256(c.s1()) == keccak256(bytes("abcd")));
    }
}
