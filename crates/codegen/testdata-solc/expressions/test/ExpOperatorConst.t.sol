// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExpOperatorConst.sol";

contract ExpOperatorConstTest {
    function test_expConst() public {
        ExpOperatorConst c = new ExpOperatorConst();
        assert(c.f() == 8);
    }
}
