// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataArrayInvalidLength {
    function f(uint256[][] calldata x) external pure returns (uint256) {
        return x[0].length;
    }
}
