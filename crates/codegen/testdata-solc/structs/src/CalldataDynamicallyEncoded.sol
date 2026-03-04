// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataDynamicallyEncoded {
    struct S {
        uint256[] a;
    }

    function f(S calldata s) external pure returns (uint256 a, uint256 b, uint256 c) {
        return (s.a.length, s.a[0], s.a[1]);
    }
}
