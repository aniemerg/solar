// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemoryStructNamedConstructor {
    struct S {
        uint256 a;
        bool x;
    }

    function s() public pure returns (S memory) {
        return S({x: true, a: 8});
    }
}
