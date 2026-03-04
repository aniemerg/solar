// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TypedMultiVariableDeclaration.sol";

contract TypedMultiVariableDeclarationTest {
    TypedMultiVariableDeclaration c;

    function setUp() public {
        c = new TypedMultiVariableDeclaration();
    }

    function test_f() public {
        assert(c.f() == true);
    }
}
