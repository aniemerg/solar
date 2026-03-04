// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ArrayMappingAbstractConstructorParam.sol";

contract ArrayMappingAbstractConstructorParamTest is Test {
    ArrayMappingAbstractConstructorParam c;

    function setUp() public {
        c = new ArrayMappingAbstractConstructorParam();
    }

    function test_valid_access() public view {
        // m(uint256,uint256,uint256): 1, 0, 1 -> 2
        assert(c.m(1, 0, 1) == 2);
        // m(uint256,uint256,uint256): 1, 0, 5 -> 0
        assert(c.m(1, 0, 5) == 0);
    }

    function test_out_of_bounds() public {
        // m(uint256,uint256,uint256): 0, 0, 0 -> FAILURE (m[0] has length 0)
        vm.expectRevert();
        c.m(0, 0, 0);
    }
}
