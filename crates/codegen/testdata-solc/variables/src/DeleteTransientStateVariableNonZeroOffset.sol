// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract DeleteTransientStateVariableNonZeroOffset {
    bytes14 transient x;
    uint32  transient y;
    uint112 transient z;

    function f() public returns (bytes14, uint32, uint112) {
        x = 0xffffffffffffffffffffffffffff;
        y = 0xffffffff;
        z = 0xffffffffffffffffffffffffffff;
        delete y;
        return (x, y, z);
    }
}
