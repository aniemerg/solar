// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConvertFixedBytesToFixedBytesGreaterSize {
    function bytesToBytes(bytes2 input) public pure returns (bytes4 ret) {
        return bytes4(input);
    }
}
