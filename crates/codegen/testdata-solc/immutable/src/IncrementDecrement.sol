// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IncrementDecrement {
    int immutable x = 1;
    int immutable y = 3;

    constructor() {
        x--;
        --x;
        y++;
        ++y;
        --y;
    }

    function f() public view returns (int, int) {
        return (x, y);
    }
}
