// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataBytesArrayBounds {
    function f(bytes[] calldata a, uint256 i) external pure returns (uint) {
        return uint8(a[0][i]);
    }
}
