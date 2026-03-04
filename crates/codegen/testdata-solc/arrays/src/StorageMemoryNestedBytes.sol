// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract StorageMemoryNestedBytes {
    bytes[] a;

    function f() public returns (bytes[] memory) {
        a.push("abc");
        a.push("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVXYZ");
        bytes[] memory m = a;
        return m;
    }
}
