// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StateVariablesInitOrderA {
    uint256 public x = 0;
    uint256 y = f();

    function f() public returns (uint256) {
        ++x;
        return 42;
    }
}

contract StateVariablesInitOrderB is StateVariablesInitOrderA {}
