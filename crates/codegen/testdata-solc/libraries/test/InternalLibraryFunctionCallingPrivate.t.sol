// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalLibraryFunctionCallingPrivate.sol";

contract InternalLibraryFunctionCallingPrivateTest {
    InternalLibraryFunctionCallingPrivate c;

    function setUp() public {
        c = new InternalLibraryFunctionCallingPrivate();
    }

    function test_f() public {
        // f() -> 2
        assert(c.f() == 2);
    }
}
