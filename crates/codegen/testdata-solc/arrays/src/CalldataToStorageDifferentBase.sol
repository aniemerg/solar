// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract CalldataToStorageDifferentBase {
    bytes10[] s;
    function f(bytes8[] calldata c) external returns (uint256, bytes10, bytes10, bytes10) {
        s = c;
        return (s.length, s[0], s[1], s[2]);
    }
}
