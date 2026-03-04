// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConvertFixedBytesToFixedBytesSameSize {
    function bytesToBytes(bytes4 input) public pure returns (bytes4 ret) {
        return bytes4(input);
    }
}
