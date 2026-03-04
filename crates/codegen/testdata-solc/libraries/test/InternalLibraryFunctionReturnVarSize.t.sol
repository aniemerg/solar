// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalLibraryFunctionReturnVarSize.sol";

contract InternalLibraryFunctionReturnVarSizeTest {
    InternalLibraryFunctionReturnVarSize c;

    function setUp() public {
        c = new InternalLibraryFunctionReturnVarSize();
    }

    function test_f() public {
        // f() -> 2
        assert(c.f() == 2);
    }
}
