// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f(uint x) public pure returns (uint y) {
        assembly { y := shl(2, x) }
    }
}
