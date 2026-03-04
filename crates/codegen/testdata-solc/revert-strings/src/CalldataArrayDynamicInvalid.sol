// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataArrayDynamicInvalid {
    function f(uint256[][] calldata a) external pure returns (uint256) {
        return 42;
    }
}
