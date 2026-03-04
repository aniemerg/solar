// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MappingAbstractConstructorParam.sol";

contract MappingAbstractConstructorParamTest {
    MappingAbstractConstructorParam c;

    function setUp() public {
        c = new MappingAbstractConstructorParam();
    }

    function test_mapping() public view {
        // m(uint256): 1 -> 0
        assert(c.m(1) == 0);
        // m(uint256): 5 -> 20
        assert(c.m(5) == 20);
    }
}
