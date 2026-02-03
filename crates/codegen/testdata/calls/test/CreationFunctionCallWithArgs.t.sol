// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CreationFunctionCallWithArgs.sol";

contract CreationFunctionCallWithArgsTest {
    CreationFunctionCallWithArgs c;

    function setUp() public {
        c = new CreationFunctionCallWithArgs(2);
    }

    function test_CreationFunctionCallWithArgs() public view {
        assert(c.f() == 2);
    }
}
