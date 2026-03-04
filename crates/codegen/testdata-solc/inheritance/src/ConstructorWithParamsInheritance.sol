// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    uint256 public i;
    uint256 public k;

    constructor(uint256 newI, uint256 newK) {
        i = newI;
        k = newK;
    }
}

contract D is C {
    constructor(uint256 newI, uint256 newK) C(newI, newK + 1) {}
}
