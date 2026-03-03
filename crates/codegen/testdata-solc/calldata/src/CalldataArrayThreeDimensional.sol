// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataArrayThreeDimensional {
    function f(uint256[][2][] calldata x, uint256 i, uint256 j, uint256 k)
        external
        pure
        returns (uint256 a, uint256 b, uint256 c, uint256 d)
    {
        a = x.length;
        b = x[i].length;
        c = x[i][j].length;
        d = x[i][j][k];
    }
}
