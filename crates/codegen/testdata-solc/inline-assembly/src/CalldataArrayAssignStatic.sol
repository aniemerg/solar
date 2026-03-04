// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataArrayAssignStatic {
    function f(uint[2][2] calldata x) public returns (uint[2][2] memory r) {
        assembly { x := 0x24 }
        r = x;
    }
}
