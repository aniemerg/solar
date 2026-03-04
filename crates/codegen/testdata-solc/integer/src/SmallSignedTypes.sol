// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SmallSignedTypes {
    function run() public returns (int256 y) {
        return -int32(10) * -int64(20);
    }
}
