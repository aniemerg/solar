// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/C99ScopingActivation.sol";

contract C99ScopingActivationTest {
    function test_C99ScopingActivation() public {
        C99ScopingActivation c = new C99ScopingActivation();
        assert(c.f() == 3);
        assert(c.g() == 0);
        (uint256 x, uint256 a, uint256 b) = c.h();
        assert(x == 3);
        assert(a == 3);
        assert(b == 4);
        (uint256 x2, uint256 a2) = c.i();
        assert(x2 == 3);
        assert(a2 == 3);
    }
}
