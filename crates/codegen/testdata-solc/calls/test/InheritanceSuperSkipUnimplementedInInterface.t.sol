// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InheritanceSuperSkipUnimplementedInInterface.sol";

contract InheritanceSuperSkipUnimplementedInInterfaceTest {
    InheritanceSuperSkipUnimplementedInInterface c;

    function setUp() public {
        c = new InheritanceSuperSkipUnimplementedInInterface();
    }

    function test_f_returns_42() public {
        assert(c.f() == 42);
    }
}
