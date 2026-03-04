// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionModifierLibraryInheritance.sol";

contract FunctionModifierLibraryInheritanceTest {
    FunctionModifierLibraryInheritance c;

    function setUp() public {
        c = new FunctionModifierLibraryInheritance();
    }

    function test_f() public {
        assert(c.f() == 0x202);
    }
}
