// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionModifierForConstructor.sol";

contract FunctionModifierForConstructorTest {
    FunctionModifierForConstructor c;

    function setUp() public {
        c = new FunctionModifierForConstructor();
    }

    function test_getData() public {
        assert(c.getData() == 6);
    }
}
