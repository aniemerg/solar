// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StorageMemoryPackedDyn {
    uint8[] a;

    function f() public returns (uint8, uint8, uint8) {
        for (uint i = 0; i < 33; i++)
            a.push(7);
        a[0] = 2;
        a[16] = 3;
        a[32] = 4;
        uint8[] memory m = a;
        return (m[0], m[16], m[32]);
    }
}
