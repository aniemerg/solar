// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CreateRandom.sol";

contract CreateRandomTest {
    CreateRandom c;

    function setUp() public {
        c = new CreateRandom();
    }

    function test_runner_matches_calc() public {
        // The actual addresses depend on the deployer address (not hardcoded here),
        // but testRunner and testCalc should produce the same results
        (address r1, address r2) = c.testRunner();
        (address c1, address c2) = c.testCalc();
        assert(r1 == c1);
        assert(r2 == c2);
    }
}
