// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AssignAtDeclaration {
    uint8 immutable a = 2;

    function f() public view returns (uint) {
        return a;
    }
}
