// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EscapeLiteral.sol";

contract EscapeLiteralTest {
    function test_EscapeLiteral() public {
        EscapeLiteral c = new EscapeLiteral();
        (uint256 len, bytes1 a, bytes1 b) = c.f();
        assert(len == 2);
        assert(a == 0x5c);
        assert(b == 0x5c);
    }
}
