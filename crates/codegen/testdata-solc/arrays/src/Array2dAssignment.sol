// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Array2dAssignment {
    function f(uint n) public pure returns (uint) {
        uint[][] memory a = new uint[][](2);
        for (uint i = 0; i < 2; ++i)
            a[i] = new uint[](3);
        a[1][1] = n;
        uint[] memory b = a[1];
        return b[1];
    }
}
