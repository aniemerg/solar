// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructMappingAbstractConstructorParam.sol";

contract StructMappingAbstractConstructorParamTest {
    StructMappingAbstractConstructorParam c;

    function setUp() public {
        c = new StructMappingAbstractConstructorParam();
    }

    function test_getM() public view {
        assert(c.getM(0, 0) == 0);
        assert(c.getM(1, 5) == 0x10);
        assert(c.getM(1, 0) == 0);
    }
}
