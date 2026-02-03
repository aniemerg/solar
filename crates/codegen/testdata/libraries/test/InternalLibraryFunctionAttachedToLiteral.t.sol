// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalLibraryFunctionAttachedToLiteral.sol";

contract InternalLibraryFunctionAttachedToLiteralTest {
    InternalLibraryFunctionAttachedToLiteral c;

    function setUp() public {
        c = new InternalLibraryFunctionAttachedToLiteral();
    }

    function test_InternalLibraryFunctionAttachedToLiteral() public view {
        assert(c.double42() == 84);
        bytes memory v = c.doubleABC();
        assert(keccak256(v) == keccak256(bytes("abcabc")));
    }
}
