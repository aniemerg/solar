// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/RequireErrorEvaluationOrder1.sol";

contract RequireErrorEvaluationOrder1Test {
    function test_RequireErrorEvaluationOrder1() public {
        RequireErrorEvaluationOrder1 c = new RequireErrorEvaluationOrder1();
        assert(c.f() == 7);
        assert(c.g() == 7);
    }
}
