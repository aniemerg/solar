// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/RequireErrorConditionEvaluatedOnce.sol";

contract RequireErrorConditionEvaluatedOnceTest {
    RequireErrorConditionEvaluatedOnce c;

    function setUp() public {
        c = new RequireErrorConditionEvaluatedOnce();
    }

    function test_RequireErrorConditionEvaluatedOnce() public {
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

        assert(selector == bytes4(keccak256("CustomError(uint256)")));
        assert(value == 1);
        assert(c.getCounter() == 0);

        c.f(true);
        assert(c.getCounter() == 1);
    }
}
