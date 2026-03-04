// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SwapInStorageOverwrite.sol";

contract SwapInStorageOverwriteTest {
    SwapInStorageOverwrite c;

    function setUp() public {
        c = new SwapInStorageOverwrite();
    }

    function test_initial() public view {
        (uint256 xa, uint256 xb) = c.x();
        (uint256 ya, uint256 yb) = c.y();
        assert(xa == 0 && xb == 0);
        assert(ya == 0 && yb == 0);
    }

    function test_set_and_swap() public {
        c.set();
        (uint256 xa, uint256 xb) = c.x();
        (uint256 ya, uint256 yb) = c.y();
        assert(xa == 1 && xb == 2);
        assert(ya == 3 && yb == 4);

        c.swap();
        // Due to no temporary storage, swap copies y into x but x is already written over
        // So both x and y end up with x's original values
        (xa, xb) = c.x();
        (ya, yb) = c.y();
        assert(xa == 1 && xb == 2);
        assert(ya == 1 && yb == 2);
    }
}
