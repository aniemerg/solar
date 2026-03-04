// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MultilineComments.sol";

contract MultilineCommentsTest {
    function test_MultilineComments() public {
        MultilineComments c = new MultilineComments();
        assert(c.f(1, 1, 1, 1, 1) == 5);
    }
}
