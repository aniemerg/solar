// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InlineArrayStorageToMemoryConversionInts {
    function f() public returns (uint256 x, uint256 y) {
        x = 3;
        y = 6;
        uint256[2] memory z = [x, y];
        return (z[0], z[1]);
    }
}
