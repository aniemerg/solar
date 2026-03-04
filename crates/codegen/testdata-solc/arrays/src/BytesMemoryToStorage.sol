// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesMemoryToStorage {
    bytes s;
    function f() external returns (bytes1) {
        bytes memory data = "abcd";
        s = data;
        return s[0];
    }
}
