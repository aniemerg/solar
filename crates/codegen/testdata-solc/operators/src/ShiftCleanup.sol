// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f() public pure returns (uint16 x) {
        unchecked {
            x = 0xffff;
            x += 32;
            x <<= 8;
            x >>= 16;
        }
    }
}
