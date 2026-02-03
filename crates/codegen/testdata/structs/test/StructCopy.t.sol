// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructCopy.sol";

contract StructCopyTest {
    StructCopy c;

    function setUp() public {
        c = new StructCopy();
    }

    function test_StructCopy() public {
        assert(c.set(7) == true);
        (uint256 a, uint256 x, uint256 y, uint256 d) = c.retrieve(7);
        assert(a == 1 && x == 3 && y == 4 && d == 2);

        assert(c.copy(7, 8) == true);
        (a, x, y, d) = c.retrieve(8);
        assert(a == 1 && x == 3 && y == 4 && d == 2);

        assert(c.copy(0, 7) == true);
        (a, x, y, d) = c.retrieve(7);
        assert(a == 0 && x == 0 && y == 0 && d == 0);

        assert(c.copy(7, 8) == true);
        (a, x, y, d) = c.retrieve(8);
        assert(a == 0 && x == 0 && y == 0 && d == 0);
    }
}
