// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalVirtualFunctionCalls.sol";

contract InternalVirtualFunctionCallsTest {
    function test_InternalVirtualFunctionCalls() public {
        Derived c = new Derived();
        // f() -> 2  (Derived.g overrides Base.g, so Base.f returns 2)
        assert(c.f() == 2);
    }
}
