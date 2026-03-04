// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f() public pure returns (uint8 x) {
        assembly {
            x := 0xffff
        }
        x >>= 8;
    }
}
