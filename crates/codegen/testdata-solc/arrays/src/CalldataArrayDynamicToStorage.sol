// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract CalldataArrayDynamicToStorage {
    uint256[] s;
    function f(uint256[] calldata data) external returns (uint) {
        s = data;
        return s[0];
    }
}
