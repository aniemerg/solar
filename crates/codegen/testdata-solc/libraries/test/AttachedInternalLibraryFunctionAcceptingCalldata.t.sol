// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AttachedInternalLibraryFunctionAcceptingCalldata.sol";

contract AttachedInternalLibraryFunctionAcceptingCalldataTest {
    AttachedInternalLibraryFunctionAcceptingCalldata c;

    function setUp() public {
        c = new AttachedInternalLibraryFunctionAcceptingCalldata();
    }

    function test_f() public view {
        // f(bytes): 0x20, 4, "abcd" -> 'a' (0x61), 'a' (0x61)
        bytes memory input = bytes("abcd");
        (bytes1 r1, bytes1 r2) = c.f(input);
        assert(r1 == 0x61);
        assert(r2 == 0x61);
    }
}
