// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataOverlappedDynamicArrays {
    uint[] s;
    uint[2] n;

    function f_memory(uint[] calldata a, uint[2] calldata b) public returns (uint[] memory, uint[2] memory) {
        return (a, b);
    }

    function f_encode(uint[] calldata a, uint[2] calldata b) public returns (bytes memory) {
        return abi.encode(a, b);
    }

    function f_which(uint[] calldata a, uint[2] calldata b, uint which) public returns (bytes memory) {
        return abi.encode(a[which], b[1]);
    }

    function f_storage(uint[] calldata a, uint[2] calldata b) public returns (bytes memory) {
        s = a;
        n = b;
        return abi.encode(s);
    }
}
