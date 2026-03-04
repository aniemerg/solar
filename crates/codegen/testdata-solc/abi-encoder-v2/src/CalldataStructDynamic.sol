// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataStructDynamic {
    struct S { uint256[] a; }

    function f(S calldata s) external returns (bytes memory) {
        return abi.encode(s);
    }

    function g(S calldata s) external returns (bytes memory) {
        return this.f(s);
    }
}
