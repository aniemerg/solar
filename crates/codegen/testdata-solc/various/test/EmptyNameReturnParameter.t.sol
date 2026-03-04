// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EmptyNameReturnParameter.sol";

contract EmptyNameReturnParameterTest {
    EmptyNameReturnParameter c;

    function setUp() public {
        c = new EmptyNameReturnParameter();
    }

    function test_f() public {
        assert(c.f(9) == 9);
    }
}
