// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MemoryStructsNestedLoad.sol";

contract MemoryStructsNestedLoadTest {
    MemoryStructsNestedLoad c;

    function setUp() public {
        c = new MemoryStructsNestedLoad();
    }

    function test_MemoryStructsNestedLoad() public {
        (uint256 a, uint256 x, uint256 y, uint256 z, uint256 a1, uint256 a2) = c.load();
        assert(a == 1 && x == 2 && y == 3 && z == 4 && a1 == 5 && a2 == 6);

        (a, x, y, z, a1, a2) = c.store();
        assert(a == 1 && x == 2 && y == 3 && z == 4 && a1 == 5 && a2 == 6);
    }
}
