// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataBytesToStorage {
    bytes s;
    function f(bytes calldata data) external returns (bytes1) {
        s = data;
        return s[0];
    }
}
