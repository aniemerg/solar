// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesStorageToMemory {
    bytes s = "abcd";
    function f() external returns (bytes1) {
        bytes memory data = s;
        return data[0];
    }
}
