// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataArrayAssignDynamic {
    function f(uint[2][] calldata x) public returns (uint[2][] memory r) {
        assembly { x.offset := 0x44 x.length := 2 }
        r = x;
    }
}
