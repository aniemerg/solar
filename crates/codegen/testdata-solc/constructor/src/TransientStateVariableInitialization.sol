// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract TransientStateVariableInitialization {
    uint128 transient x;
    uint128 y;

    constructor() {
        x = 100;
        y = x;
    }

    function f() external view returns (uint128) {
        return y;
    }
}
