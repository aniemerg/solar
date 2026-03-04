// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalLibraryFunctionAttachedToInterface.sol";

contract InternalLibraryFunctionAttachedToInterfaceTest {
    InternalLibraryFunctionAttachedToInterface c;

    function setUp() public {
        c = new InternalLibraryFunctionAttachedToInterface();
    }

    function test_test() public {
        // test() -> 42
        assert(c.run() == 42);
    }
}
