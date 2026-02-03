// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConstructorOrderOfEvaluation.sol";

contract ConstructorOrderOfEvaluationTest {
    function test_ConstructorOrderOfEvaluation() public {
        ConstructorOrderOfEvaluation c = new ConstructorOrderOfEvaluation();
        uint256[] memory values = c.g();
        assert(values.length == 4);
        assert(values[0] == 1);
        assert(values[1] == 3);
        assert(values[2] == 2);
        assert(values[3] == 4);
    }
}
