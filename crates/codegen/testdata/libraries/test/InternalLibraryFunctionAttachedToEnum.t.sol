// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalLibraryFunctionAttachedToEnum.sol";

contract InternalLibraryFunctionAttachedToEnumTest {
    InternalLibraryFunctionAttachedToEnum c;

    function setUp() public {
        c = new InternalLibraryFunctionAttachedToEnum();
    }

    function test_InternalLibraryFunctionAttachedToEnum() public view {
        assert(c.equalsA(0) == true);
        assert(c.equalsA(1) == false);
    }
}
