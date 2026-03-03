// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExponentiationSignedBase.sol";

contract ExponentiationSignedBaseTest {
    function test_ExponentiationSignedBase() public {
        ExponentiationSignedBase c = new ExponentiationSignedBase();
        (int256 a, int256 b) = c.f();
        assert(a == 9);
        assert(b == -27);
    }
}
