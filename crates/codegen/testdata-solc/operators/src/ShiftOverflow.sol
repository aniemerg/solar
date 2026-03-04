// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function leftU(uint8 x, uint8 y) public pure returns (uint8) {
        return x << y;
    }

    function leftS(int8 x, uint8 y) public pure returns (int8) {
        return x << y;
    }
}
