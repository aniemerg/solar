// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Array2dNew {
    function f(uint n) public pure returns (uint) {
        uint[][] memory a = new uint[][](2);
        for (uint i = 0; i < 2; ++i)
            a[i] = new uint[](3);
        return a[0][0] = n;
    }
}
