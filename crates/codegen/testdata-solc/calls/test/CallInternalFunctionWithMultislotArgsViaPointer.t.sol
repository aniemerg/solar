// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CallInternalFunctionWithMultislotArgsViaPointer.sol";

contract CallInternalFunctionWithMultislotArgsViaPointerTest {
    CallInternalFunctionWithMultislotArgsViaPointer c;

    function setUp() public {
        c = new CallInternalFunctionWithMultislotArgsViaPointer();
    }

    function test_test_returns_12() public {
        assert(c.test() == 12);
    }
}
