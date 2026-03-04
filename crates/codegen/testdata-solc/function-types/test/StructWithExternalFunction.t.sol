// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructWithExternalFunction.sol";

contract StructWithExternalFunctionTest {
    function test_structExternalFunction() public {
        StructWithExternalFunction c = new StructWithExternalFunction();
        (uint a, uint b) = c.f();
        assert(a == 1);
        assert(b == 2);
    }
}
