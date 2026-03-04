// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ReturnVariable.sol";

contract ReturnVariableTest {
    function test_ReturnVariable() public {
        ReturnVariable c = new ReturnVariable();
        // f() -> 0x0500, 0x0500, 0x0a00
        (uint a, uint b, uint cc) = c.f();
        assert(a == 0x0500);
        assert(b == 0x0500);
        assert(cc == 0x0a00);
    }
}
