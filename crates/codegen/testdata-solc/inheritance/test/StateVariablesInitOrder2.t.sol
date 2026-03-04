// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StateVariablesInitOrder2.sol";

contract StateVariablesInitOrder2Test {
    B b;

    function setUp() public {
        b = new B();
    }

    function test_StateVariablesInitOrder2() public {
        assert(b.z() == 1);
    }
}
