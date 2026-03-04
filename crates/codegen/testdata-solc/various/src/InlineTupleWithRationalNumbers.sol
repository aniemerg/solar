// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InlineTupleWithRationalNumbers {
    function f() public returns (int8) {
        int8[5] memory foo3 = [int8(1), -1, 0, 0, 0];
        return foo3[0];
    }
}
