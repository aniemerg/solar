// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConvertFixedBytesToFixedBytesSmallerSize {
    function bytesToBytes(bytes4 input) public pure returns (bytes2 ret) {
        return bytes2(input);
    }
}
