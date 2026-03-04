// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataStruct {
    struct S {
        uint256 a;
        uint256 b;
    }

    function f(S calldata s) external pure returns (uint256 a, uint256 b) {
        a = s.a;
        b = s.b;
    }
}
