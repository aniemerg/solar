// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

function sum(uint[] memory arr) returns (uint result) {
    for(uint i = 0; i < arr.length; i++) {
        result += arr[i];
    }
}

using {sum} for uint[];

contract CalldataMemoryCopy {
    function f(uint[] calldata arr) external returns (uint) {
        return arr.sum();
    }
}
