// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/GweiLiteral.sol";

contract GweiLiteralTest {
    function test_GweiLiteral() public {
        GweiLiteral c = new GweiLiteral();
        assert(c.value() == 1000000000);
    }
}
