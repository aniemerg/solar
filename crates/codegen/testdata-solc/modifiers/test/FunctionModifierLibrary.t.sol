// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionModifierLibrary.sol";

contract FunctionModifierLibraryTest {
    FunctionModifierLibrary c;

    function setUp() public {
        c = new FunctionModifierLibrary();
    }

    function test_f() public {
        assert(c.f() == 0x202);
    }
}
