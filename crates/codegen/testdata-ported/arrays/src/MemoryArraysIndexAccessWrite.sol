// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemoryArraysIndexAccessWrite {
    function set(uint24[3][4] memory x) public pure {
        x[2][2] = 1;
        x[3][2] = 7;
    }

    function f() public pure returns (uint24[3][4] memory) {
        uint24[3][4] memory data;
        set(data);
        return data;
    }
}
