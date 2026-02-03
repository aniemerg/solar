// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EmptyForLoop.sol";

contract EmptyForLoopTest {
    function test_EmptyForLoop() public {
        EmptyForLoop c = new EmptyForLoop();
        assert(c.f() == 10);
    }
}
