// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataWithGarbage {
    uint[] aTmp;
    uint[2] bTmp;

    function f_memory(uint[] calldata a) public returns (uint[] memory) {
        return a;
    }

    function f_encode(uint[] calldata a) public returns (bytes memory) {
        return abi.encode(a);
    }

    function f_storage(uint[] calldata a) public returns (bytes memory) {
        aTmp = a;
        return abi.encode(aTmp);
    }

    function f_index(uint[] calldata a, uint which) public returns (uint) {
        return a[which];
    }

    function g_memory(uint[] calldata a, uint[2] calldata b) public returns (uint[] memory, uint[2] memory) {
        return (a, b);
    }

    function g_encode(uint[] calldata a, uint[2] calldata b) public returns (bytes memory) {
        return abi.encode(a, b);
    }

    function g_storage(uint[] calldata a, uint[2] calldata b) public returns (bytes memory) {
        aTmp = a;
        bTmp = b;
        return abi.encode(aTmp, bTmp);
    }

    function g_index(uint[] calldata a, uint[2] calldata b, uint which) public returns (uint, uint) {
        return (a[which], b[0]);
    }
}
