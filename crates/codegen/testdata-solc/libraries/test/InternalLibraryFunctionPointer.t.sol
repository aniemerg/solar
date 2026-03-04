// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalLibraryFunctionPointer.sol";

contract InternalLibraryFunctionPointerTest {
    InternalLibraryFunctionPointer c;

    function setUp() public {
        c = new InternalLibraryFunctionPointer();
    }

    function test_g() public {
        // g() -> 66
        assert(c.g() == 66);
    }
}
