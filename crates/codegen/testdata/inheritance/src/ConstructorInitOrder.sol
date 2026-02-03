// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConstructorInitOrderA {
    uint256 x;

    constructor() {
        x = 42;
    }

    function f() public view returns (uint256) {
        return x;
    }
}

contract ConstructorInitOrderB is ConstructorInitOrderA {
    uint256 public y = f();
}
