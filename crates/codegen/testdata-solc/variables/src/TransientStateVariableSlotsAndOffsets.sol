// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract TransientStateVariableSlotsAndOffsets {
    uint128 transient x;
    uint64 transient y;
    uint64 transient w;
    uint256 transient z;

    function f() external returns (uint128, uint64, uint64, uint256) {
        x = 1;
        y = 2;
        w = 3;
        z = 4;

        return (x, y, w, z);
    }
}
