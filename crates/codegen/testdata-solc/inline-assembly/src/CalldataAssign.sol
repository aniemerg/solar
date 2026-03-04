// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataAssign {
    function f(bytes calldata x) public returns (bytes memory) {
        assembly { x.offset := 1 x.length := 3 }
        return x;
    }
}
