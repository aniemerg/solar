// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CleanupInCompoundAssign.sol";

contract CleanupInCompoundAssignTest {
    function test_CleanupInCompoundAssign() public {
        CleanupInCompoundAssign c = new CleanupInCompoundAssign();
        (uint256 x, uint256 y) = c.test();
        assert(x == 0xff);
        assert(y == 0xff);
    }
}
