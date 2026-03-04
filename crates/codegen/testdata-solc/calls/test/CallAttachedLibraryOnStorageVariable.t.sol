// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CallAttachedLibraryOnStorageVariable.sol";

contract CallAttachedLibraryOnStorageVariableTest {
    CallAttachedLibraryOnStorageVariable c;

    function setUp() public {
        c = new CallAttachedLibraryOnStorageVariable();
    }

    function test_f_returns_42() public {
        // 6 * 7 = 42
        assert(c.f(7) == 42);
    }

    function test_x_is_42_after_f() public {
        c.f(7);
        assert(c.x() == 42);
    }
}
