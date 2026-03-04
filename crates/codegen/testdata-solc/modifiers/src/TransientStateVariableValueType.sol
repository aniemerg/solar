// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract TransientStateVariableValueType {
    uint16 transient x;

    modifier m(uint16) {
        x += 10;
        _;
    }

    function f() public m(x) returns (uint16) {
        x *= 10;
        return x;
    }
}
