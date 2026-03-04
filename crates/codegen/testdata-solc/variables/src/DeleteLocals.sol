// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeleteLocals {
    function delLocal() public pure returns (uint res1, uint res2) {
        uint v = 5;
        uint w = 6;
        uint x = 7;
        delete v;
        res1 = w;
        res2 = x;
    }
}
