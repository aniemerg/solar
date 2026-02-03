// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConstructorWithParams {
    uint256 public i;
    uint256 public k;

    constructor(uint256 newI, uint256 newK) {
        i = newI;
        k = newK;
    }
}
