// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataStructArrayReencode {
    struct D { uint[] x; }
    struct S { uint x; }

    function f(D calldata a) public returns (bytes memory){
        return abi.encode(a);
    }

    function g(D[2] calldata a) public returns (bytes memory) {
        return abi.encode(a);
    }

    function h(D[][] calldata a) public returns (bytes memory) {
        return abi.encode(a);
    }

    function i(D[2][] calldata a) public returns (bytes memory) {
        return abi.encode(a);
    }

    function j(S[] memory a) public returns (bytes memory) {
        return abi.encode(a);
    }

    function k(S[2] memory a) public returns (bytes memory) {
        return abi.encode(a);
    }

    function l(S[][] memory a) public returns (bytes memory) {
        return abi.encode(a);
    }
}
