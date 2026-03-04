// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ByteOptimizationBug.sol";

contract ByteOptimizationBugTest {
    ByteOptimizationBug c;

    function setUp() public {
        c = new ByteOptimizationBug();
    }

    function test_f() public {
        assert(c.f(2) == 0);
    }

    function test_g() public {
        assert(c.g(2) == 2);
    }
}
