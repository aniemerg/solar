// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArraySlices {
    function f(uint256 start, uint256 end, uint256[] calldata arr) external pure {
        arr[start:end];
    }
}
