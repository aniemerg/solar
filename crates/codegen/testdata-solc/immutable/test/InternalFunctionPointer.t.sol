// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalFunctionPointer.sol";

contract InternalFunctionPointerTest {
    function test_InternalFunctionPointer() public {
        InternalFunctionPointer c = new InternalFunctionPointer();
        assert(c.f() == 7);
        assert(c.callZ() == 7);
    }
}
