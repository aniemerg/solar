// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesCalldataToStringCalldata {
    function f(bytes calldata c) public returns (string calldata s) {
        return string(c);
    }
}
