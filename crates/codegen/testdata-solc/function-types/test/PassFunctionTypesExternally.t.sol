// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PassFunctionTypesExternally.sol";

contract PassFunctionTypesExternallyTest {
    function test_passExternally() public {
        PassFunctionTypesExternally c = new PassFunctionTypesExternally();
        assert(c.f(7) == 8);
        assert(c.f2(7) == 8);
    }
}
