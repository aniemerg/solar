// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalLibraryFunctionAttachedToStruct.sol";

contract InternalLibraryFunctionAttachedToStructTest {
    InternalLibraryFunctionAttachedToStruct c;

    function setUp() public {
        c = new InternalLibraryFunctionAttachedToStruct();
    }

    function test_f() public {
        // f() -> 2
        assert(c.f() == 2);
    }
}
