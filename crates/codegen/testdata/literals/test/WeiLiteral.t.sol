// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/WeiLiteral.sol";

contract WeiLiteralTest {
    function test_WeiLiteral() public {
        WeiLiteral c = new WeiLiteral();
        assert(c.value() == 1);
    }
}
