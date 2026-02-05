// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EtherLiteral.sol";

contract EtherLiteralTest {
    function test_EtherLiteral() public {
        EtherLiteral c = new EtherLiteral();
        assert(c.value() == 1000000000000000000);
    }
}
