// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructWithFunctions.sol";

contract StructWithFunctionsTest {
    function test_structInternalFunction() public {
        StructWithFunctions c = new StructWithFunctions();
        (uint a, uint b) = c.f();
        assert(a == 1);
        assert(b == 2);
    }
}
