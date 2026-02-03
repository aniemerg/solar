// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConstructorStaticArrayArgument {
    uint256 public a;
    uint256[3] public b;

    constructor(uint256 _a, uint256[3] memory _b) {
        a = _a;
        b = _b;
    }
}
