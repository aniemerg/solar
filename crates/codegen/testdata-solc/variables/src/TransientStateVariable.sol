// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract TransientStateVariable {
    uint transient public x;

    function f() public {
        x = 8;
    }
    function g() public returns (uint) {
        x = 0;
        this.f();
        return x;
    }
    function h() public view returns (uint) {
        return x;
    }
}
