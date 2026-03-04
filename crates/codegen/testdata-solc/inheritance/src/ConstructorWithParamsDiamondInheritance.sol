// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    uint256 public i;
    uint256 public k;

    constructor(uint256 newI, uint256 newK) {
        i = newI;
        k = newK;
    }
}

abstract contract B is A {
    uint256 public j;

    constructor(uint256 newJ) {
        j = newJ;
    }
}

contract C is A {
    constructor(uint256 newI, uint256 newK) A(newI, newK) {}
}

contract D is B, C {
    constructor(uint256 newI, uint256 newK) B(newI) C(newI, newK + 1) {}
}
