// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/DoWhileLoopContinue.sol";

contract DoWhileLoopContinueTest {
    function test_DoWhileLoopContinue() public {
        DoWhileLoopContinue c = new DoWhileLoopContinue();
        assert(c.f() == 42);
    }
}
