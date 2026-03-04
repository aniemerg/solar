// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AbiDecodeDynamicArray {
    function f(bytes calldata data) external pure returns (uint256[] memory) {
        return abi.decode(data, (uint256[]));
    }
}
