// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExponentiationLiteralBase.sol";

contract ExponentiationLiteralBaseTest {
    function test_ExponentiationLiteralBase() public {
        ExponentiationLiteralBase c = new ExponentiationLiteralBase();
        check(c, 0, 1, 1);
        check(c, 1, 2, -2);
        check(c, 2, 4, 4);
        check(c, 13, 0x2000, -8192);
        check(c, 113, 0x020000000000000000000000000000, -10384593717069655257060992658440192);
        check(c, 114, 0x040000000000000000000000000000, 20769187434139310514121985316880384);
        check(c, 1113, 0, 0);
        check(c, 1114, 0, 0);
    }

    function check(ExponentiationLiteralBase c, uint256 x, uint256 expectedA, int256 expectedB) internal {
        (uint256 a, int256 b) = c.f(x);
        assert(a == expectedA);
        assert(b == expectedB);
    }
}
