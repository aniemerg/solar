// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract DeleteTransientStateVariable {
    uint transient x;
    function f() public returns (uint) {
        x = 10;
        delete x;
        return x;
    }
}
