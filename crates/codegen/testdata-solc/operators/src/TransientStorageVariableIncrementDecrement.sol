// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract C {
    int transient x;
    function f() public returns (int) {
        ++x;
        ++x;
        --x;
        x++;
        x--;
        return x;
    }
}
