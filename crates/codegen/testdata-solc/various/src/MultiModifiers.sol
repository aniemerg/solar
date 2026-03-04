// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// This triggered a bug in some version because the variable in the modifier was not
// unregistered correctly.
contract MultiModifiers {
    uint256 public x;

    modifier m1() {
        address a1 = msg.sender;
        x++;
        _;
    }

    function f1() public m1() {
        x += 7;
    }

    function f2() public m1() {
        x += 3;
    }
}
