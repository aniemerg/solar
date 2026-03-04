// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/DuplicatedFunctionDefinition.sol";

contract DuplicatedFunctionDefinitionTest {
    function test_duplicatedFunctionPointers() public {
        DuplicatedFunctionDefinition c = new DuplicatedFunctionDefinition();
        c.f();
    }
}
