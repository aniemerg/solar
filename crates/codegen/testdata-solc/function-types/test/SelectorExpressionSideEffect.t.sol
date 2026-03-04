// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SelectorExpressionSideEffect.sol";

contract SelectorExpressionSideEffectTest {
    function test_selectorSideEffect() public {
        SelectorExpressionSideEffect c = new SelectorExpressionSideEffect();
        assert(c.f() == 42);
    }
}
