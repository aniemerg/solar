// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KeccakOptimizationBugString {
    function f(string memory s) public returns (bool ret) {
        assembly {
            let a := keccak256(s, 32)
            let b := keccak256(s, 8)
            ret := eq(a, b)
        }
    }
}
