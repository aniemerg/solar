// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalLibraryFunctionAttachedToStringAcceptingStorage.sol";

contract InternalLibraryFunctionAttachedToStringAcceptingStorageTest {
    InternalLibraryFunctionAttachedToStringAcceptingStorage c;

    function setUp() public {
        c = new InternalLibraryFunctionAttachedToStringAcceptingStorage();
    }

    function test_test() public {
        // test(string): "def" -> "def", "def"
        (string memory r1, string memory r2) = c.run("def");
        assert(keccak256(bytes(r1)) == keccak256(bytes("def")));
        assert(keccak256(bytes(r2)) == keccak256(bytes("def")));
    }
}
