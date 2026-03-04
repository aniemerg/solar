// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MultiVariableDeclaration.sol";

contract MultiVariableDeclarationTest {
    MultiVariableDeclaration c;

    function setUp() public {
        c = new MultiVariableDeclaration();
    }

    function test_f() public {
        assert(c.f() == true);
    }
}
