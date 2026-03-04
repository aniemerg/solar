// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringCalldataToBytesCalldata {
    function f(string calldata s) public pure returns (bytes calldata m) {
        return bytes(s);
    }
}
