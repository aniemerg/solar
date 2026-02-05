// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IncDecOperators {
    uint256 public v;

    function f() public returns (uint256 r) {
        uint256 a = 6;
        r = a;
        r += (a++) * 0x10;
        r += (++a) * 0x100;
        v = 3;
        r += (v++) * 0x1000;
        r += (++v) * 0x10000;
    }
}
