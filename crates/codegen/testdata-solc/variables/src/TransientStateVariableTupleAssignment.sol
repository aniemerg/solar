// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract TransientStateVariableTupleAssignment {
    uint transient x;
    uint y;
    uint transient w;
    uint z;

    function f() public returns (uint, uint, uint) {
        x = 1;
        y = 2;
        w = 3;
        z = 4;

        (x, y, w) = (y, w, z);
        return (x, y, w);
    }
}
