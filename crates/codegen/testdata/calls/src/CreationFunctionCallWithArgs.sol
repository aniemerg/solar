// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CreationFunctionCallWithArgsC {
    uint256 public i;
    constructor(uint256 newI) { i = newI; }
}

contract CreationFunctionCallWithArgs {
    CreationFunctionCallWithArgsC c;

    constructor(uint256 v) {
        c = new CreationFunctionCallWithArgsC(v);
    }

    function f() public view returns (uint256) {
        return c.i();
    }
}
