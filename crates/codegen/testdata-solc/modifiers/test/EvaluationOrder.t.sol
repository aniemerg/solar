// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EvaluationOrder.sol";

contract EvaluationOrderTest {
    EvaluationOrder c;

    function setUp() public {
        c = new EvaluationOrder();
    }

    function test_EvaluationOrder() public view {
        uint256[] memory r = c.query();
        assert(r.length == 7);
        assert(r[0] == 4);
        assert(r[1] == 2);
        assert(r[2] == 6);
        assert(r[3] == 1);
        assert(r[4] == 3);
        assert(r[5] == 5);
        assert(r[6] == 7);
    }
}
