// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionReturnParameter.sol";

contract FunctionReturnParameterTest {
    FunctionReturnParameter c;

    function setUp() public {
        c = new FunctionReturnParameter();
    }

    function test_f() public {
        assert(c.f(5) == bytes7(0));
    }
}
