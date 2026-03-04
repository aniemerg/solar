// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BlockInsideUnchecked.sol";

contract BlockInsideUncheckedTest {
    BlockInsideUnchecked c;

    function setUp() public {
        c = new BlockInsideUnchecked();
    }

    function test_BlockInsideUnchecked() public view {
        // unchecked max + 1 wraps to 0
        assert(c.f() == 0);
    }
}
