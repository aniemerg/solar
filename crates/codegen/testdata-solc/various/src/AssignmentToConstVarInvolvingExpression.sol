// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AssignmentToConstVarInvolvingExpression {
    uint256 constant x = 0x123 + 0x456;

    function f() public returns (uint256) {
        return x + 1;
    }
}
