// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AssignAtDeclaration.sol";

contract AssignAtDeclarationTest {
    function test_AssignAtDeclaration() public {
        AssignAtDeclaration c = new AssignAtDeclaration();
        assert(c.f() == 2);
    }
}
