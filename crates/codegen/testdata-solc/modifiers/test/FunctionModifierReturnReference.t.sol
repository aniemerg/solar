// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionModifierReturnReference.sol";

contract FunctionModifierReturnReferenceTest {
    FunctionModifierReturnReference c;

    function setUp() public {
        c = new FunctionModifierReturnReference();
    }

    function test_f() public {
        (uint x, uint y) = c.f();
        assert(x == 2);
        assert(y == 3);
    }
}
