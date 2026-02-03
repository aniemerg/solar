// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CreationFunctionCallNoArgsC {
    uint256 public i;
    constructor() { i = 2; }
}

contract CreationFunctionCallNoArgs {
    function f() public returns (uint256) {
        return new CreationFunctionCallNoArgsC().i();
    }
}
