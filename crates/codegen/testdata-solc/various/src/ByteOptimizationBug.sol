// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ByteOptimizationBug {
    function f(uint256 x) public returns (uint256 a) {
        assembly {
            a := byte(x, 31)
        }
    }

    function g(uint256 x) public returns (uint256 a) {
        assembly {
            a := byte(31, x)
        }
    }
}
