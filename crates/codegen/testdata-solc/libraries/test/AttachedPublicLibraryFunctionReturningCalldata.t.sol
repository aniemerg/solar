// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AttachedPublicLibraryFunctionReturningCalldata.sol";

contract AttachedPublicLibraryFunctionReturningCalldataTest {
    AttachedPublicLibraryFunctionReturningCalldata c;

    function setUp() public {
        c = new AttachedPublicLibraryFunctionReturningCalldata();
    }

    function test_f() public view {
        // f(bytes): "abcd" -> 'a', 'a'
        bytes memory input = bytes("abcd");
        (bytes1 r1, bytes1 r2) = c.f(input);
        assert(r1 == 0x61);
        assert(r2 == 0x61);
    }
}
