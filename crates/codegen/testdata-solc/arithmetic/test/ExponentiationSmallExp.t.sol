// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExponentiationSmallExp.sol";

contract ExponentiationSmallExpTest {
    function test_ExponentiationSmallExp() public {
        ExponentiationSmallExp c = new ExponentiationSmallExp();
        assert(c.f() == 4);
    }
}
