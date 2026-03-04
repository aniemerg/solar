// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/VirtualFunctionCalls.sol";

contract VirtualFunctionCallsTest {
    function test_VirtualFunctionCalls() public {
        VirtualFunctionCalls c = new VirtualFunctionCalls();
        // g() -> 2
        assert(c.g() == 2);
        // f() -> 2  (Base.f calls g(), which is overridden to return 2)
        assert(c.f() == 2);
    }
}
