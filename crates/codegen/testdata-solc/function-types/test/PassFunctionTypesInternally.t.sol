// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PassFunctionTypesInternally.sol";

contract PassFunctionTypesInternallyTest {
    function test_passInternally() public {
        PassFunctionTypesInternally c = new PassFunctionTypesInternally();
        assert(c.f(7) == 8);
    }
}
