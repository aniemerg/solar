// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExponentiationLiteralBase.sol";

contract ExponentiationLiteralBaseTest {
    function test_ExponentiationLiteralBase() public {
        ExponentiationLiteralBase c = new ExponentiationLiteralBase();

        (uint256 a0, int256 b0) = c.f(0);
        assert(a0 == 1);
        assert(b0 == 1);

        (uint256 a1, int256 b1) = c.f(1);
        assert(a1 == 2);
        assert(b1 == -2);

        (uint256 a2, int256 b2) = c.f(2);
        assert(a2 == 4);
        assert(b2 == 4);

        (uint256 a13, int256 b13) = c.f(13);
        assert(a13 == 0x2000);
        assert(b13 == -8192);

        (uint256 a113, int256 b113) = c.f(113);
        assert(a113 == 0x020000000000000000000000000000);
        assert(b113 == -10384593717069655257060992658440192);

        (uint256 a114, int256 b114) = c.f(114);
        assert(a114 == 0x040000000000000000000000000000);
        assert(b114 == 20769187434139310514121985316880384);

        (uint256 a1113, int256 b1113) = c.f(1113);
        assert(a1113 == 0);
        assert(b1113 == 0);

        (uint256 a1114, int256 b1114) = c.f(1114);
        assert(a1114 == 0);
        assert(b1114 == 0);
    }
}
