// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExpZeroLiteral.sol";

contract ExpZeroLiteralTest {
    function test_zeroToZero() public {
        ExpZeroLiteral c = new ExpZeroLiteral();
        assert(c.f() == 1);
    }
}
