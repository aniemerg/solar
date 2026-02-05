// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalLibraryFunctionAttachedToBool.sol";

contract InternalLibraryFunctionAttachedToBoolTest {
    InternalLibraryFunctionAttachedToBool c;

    function setUp() public {
        c = new InternalLibraryFunctionAttachedToBool();
    }

    function test_InternalLibraryFunctionAttachedToBool() public view {
        assert(c.foo(true, true) == false);
        assert(c.foo(true, false) == true);
        assert(c.foo(false, true) == true);
        assert(c.foo(false, false) == false);
    }
}
