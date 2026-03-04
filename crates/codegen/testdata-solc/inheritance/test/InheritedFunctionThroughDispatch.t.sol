// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InheritedFunctionThroughDispatch.sol";

contract InheritedFunctionThroughDispatchTest {
    B b;

    function setUp() public {
        b = new B();
    }

    function test_InheritedFunctionThroughDispatch() public {
        assert(b.g() == 1);
    }
}
