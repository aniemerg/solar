// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FreeFunctionBraces.sol";

contract FreeFunctionBracesTest {
    FreeFunctionBraces c;

    function setUp() public {
        c = new FreeFunctionBraces();
    }

    function test_f_and_g() public view {
        assert(c.f(10) == 10);
        assert(c.g(10) == 0);
        assert(c.f(256) == 256);
        assert(c.g(256) == 0);
    }
}
