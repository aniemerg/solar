// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FixedBytesIndexAccess {
    bytes16[] public data;

    function f(bytes32 x) public pure returns (bytes1) {
        return x[2];
    }

    function g(bytes32 x) public returns (uint256) {
        data = [bytes16(x[0]), bytes16(x[1]), bytes16(x[2])];
        data[0] = "12345";
        return uint256(uint8(data[0][4]));
    }
}
