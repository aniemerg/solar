// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataBytesInternal {
    function f(bytes calldata b, uint256 i) internal pure returns (bytes1) {
        return b[i];
    }

    function f(uint256, bytes calldata b, uint256) external pure returns (bytes1) {
        return f(b, 2);
    }
}
