// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract Structs {
    struct S {
        uint a;
        uint b;
    }

    struct T {
        uint a;
        uint b;
        string s;
    }

    function s() public pure returns (S memory) {
        return S(23, 42);
    }

    function t() public pure returns (T memory) {
        return T(23, 42, "any");
    }
}
