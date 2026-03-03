// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataBytesToMemoryEncode {
    function f(bytes calldata data) external pure returns (bytes memory) {
        return abi.encode(bytes(data));
    }
}
