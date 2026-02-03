// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/RequireErrorEvaluationOrder2.sol";

contract RequireErrorEvaluationOrder2Test {
    function test_RequireErrorEvaluationOrder2() public {
        RequireErrorEvaluationOrder2 c = new RequireErrorEvaluationOrder2();
        bytes4 selector;
        uint256 value;

        try c.f(false) {
            assert(false);
        } catch (bytes memory data) {
            assembly {
                selector := mload(add(data, 32))
                value := mload(add(data, 36))
            }
        }

        assert(selector == bytes4(keccak256("E(uint256)")));
        assert(value == 42);

        c.f(true);
    }
}
