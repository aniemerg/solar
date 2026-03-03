// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataInternalFunctionPointer.sol";

contract CalldataInternalFunctionPointerTest {
    CalldataInternalFunctionPointer c;

    function setUp() public {
        c = new CalldataInternalFunctionPointer();
    }

    function test_CalldataInternalFunctionPointer() public {
        bytes1 result = c.g();
        assert(result == 0x07);
    }
}
