// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AssignmentToConstVarInvolvingKeccak {
    bytes32 constant x = keccak256("abc");

    function f() public pure returns (bytes32) {
        return x;
    }
}
