// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Keccak256Assembly {
    function f() public pure returns (bytes32 ret) {
        assembly {
            ret := keccak256(0, 0)
        }
    }
}
