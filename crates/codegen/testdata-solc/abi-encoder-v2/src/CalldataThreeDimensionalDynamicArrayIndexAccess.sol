// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataThreeDimensionalDynamicArrayIndexAccess {
    struct S { uint[] a; }

    function f(uint[][] calldata s, uint i, uint j) public pure returns (bytes memory) {
        return abi.encode(s[i][j]);
    }

    function g(uint[][][] calldata s, uint i, uint j, uint m) public pure returns (bytes memory) {
        return abi.encode(s[i][j][m]);
    }

    function h(uint[][][1] calldata s, uint i) public pure returns (bytes memory) {
        return abi.encode(s[0][i]);
    }

    function k(S[][] calldata s, uint i, uint j) public pure returns (bytes memory) {
        return abi.encode(s[i][j].a);
    }

    function l(S[2][2] calldata s, uint i, uint j) public pure returns (bytes memory) {
        return abi.encode(s[i][j].a);
    }
}
