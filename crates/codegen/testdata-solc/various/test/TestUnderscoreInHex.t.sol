// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TestUnderscoreInHex.sol";

contract TestUnderscoreInHexTest {
    TestUnderscoreInHex c;

    function setUp() public {
        c = new TestUnderscoreInHex();
    }

    function test_f_true() public view {
        assert(c.f(true) == 0x1234ab);
    }

    function test_f_false() public view {
        assert(c.f(false) == 0x1234abcd1234);
    }
}
