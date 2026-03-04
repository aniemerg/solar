// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Memory {
    function h(uint[4] memory n) public pure returns (uint) {
        return n[0] + n[1] + n[2] + n[3];
    }

    function i(uint[4] memory n) public view returns (uint) {
        return this.h(n) * 2;
    }
}
