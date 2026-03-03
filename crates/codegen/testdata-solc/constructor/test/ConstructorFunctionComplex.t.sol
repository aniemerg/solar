// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConstructorFunctionComplex.sol";

contract ConstructorFunctionComplexTest {
    function test_ConstructorFunctionComplex() public {
        C c = new C();
        uint r = c.f();
        assert(r == 16);
    }
}
