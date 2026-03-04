// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InheritanceSuperSkipUnimplementedInAbstractContract.sol";

contract InheritanceSuperSkipUnimplementedInAbstractContractTest {
    InheritanceSuperSkipUnimplementedInAbstractContract c;

    function setUp() public {
        c = new InheritanceSuperSkipUnimplementedInAbstractContract();
    }

    function test_f_returns_42() public {
        assert(c.f() == 42);
    }
}
