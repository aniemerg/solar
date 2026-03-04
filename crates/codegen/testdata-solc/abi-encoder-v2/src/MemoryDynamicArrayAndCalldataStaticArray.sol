// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemoryDynamicArrayAndCalldataStaticArray {
    function f(uint256[] memory a, uint256[1] calldata b) public returns (bytes memory) {
        return abi.encode(a, b);
    }

    function g(uint256[] memory a, uint256[1] calldata b) external returns (bytes memory) {
        return f(a, b);
    }

    function h(uint256[] memory a, uint256[1] calldata b) external returns (uint256[] memory, uint256[1] memory) {
        uint256[1] memory bm;
        bm[0] = b[0];
        return (a, bm);
    }
}
