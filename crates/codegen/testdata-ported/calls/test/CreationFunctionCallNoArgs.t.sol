// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CreationFunctionCallNoArgs.sol";

contract CreationFunctionCallNoArgsTest {
    CreationFunctionCallNoArgs c;

    function setUp() public {
        c = new CreationFunctionCallNoArgs();
    }

    function test_CreationFunctionCallNoArgs() public {
        assert(c.f() == 2);
    }
}
