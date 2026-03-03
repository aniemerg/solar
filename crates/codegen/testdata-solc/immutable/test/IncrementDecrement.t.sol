// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/IncrementDecrement.sol";

contract IncrementDecrementTest {
    function test_IncrementDecrement() public {
        IncrementDecrement c = new IncrementDecrement();
        (int xv, int yv) = c.f();
        // x: starts 1, x-- -> 0, --x -> -1
        assert(xv == -1);
        // y: starts 3, y++ -> 4, ++y -> 5, --y -> 4
        assert(yv == 4);
    }
}
