// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StateVariableInitialization {
    uint256 public i = 1;
    uint256 public k = 2;

    constructor() {
        i = i + i;
        k = k - i;
    }
}
