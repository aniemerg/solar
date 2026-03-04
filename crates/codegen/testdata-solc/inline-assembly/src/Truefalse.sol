// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Truefalse {
    function f() public returns (uint x, uint y) {
        assembly {
            x := true
            y := false
        }
    }
}
