// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    uint256 public x = 2;

    constructor(uint256) {}

    function f() public returns (uint256) {
        x = 4;
    }
}

contract B is A {
    constructor() A(f()) {}
}
