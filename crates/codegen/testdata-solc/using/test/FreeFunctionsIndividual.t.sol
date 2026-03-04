// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FreeFunctionsIndividual.sol";

contract FreeFunctionsIndividualTest {
    FreeFunctionsIndividual c;

    function setUp() public {
        c = new FreeFunctionsIndividual();
    }

    function test_f_and_g() public view {
        assert(c.f(10) == 10);
        assert(c.g(10) == 0);
        assert(c.f(256) == 256);
        assert(c.g(256) == 0);
    }
}
