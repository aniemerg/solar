// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ArrayAccessor.sol";

contract ArrayAccessorTest is Test {
    ArrayAccessor c;

    function setUp() public {
        c = new ArrayAccessor();
    }

    function test_ArrayAccessor_Fixed() public {
        assert(c.data(0) == 8);
        vm.expectRevert();
        c.data(8);
    }

    function test_ArrayAccessor_Dynamic() public {
        assert(c.dynamicData(2) == 8);
        vm.expectRevert();
        c.dynamicData(8);
    }

    function test_ArrayAccessor_SmallType() public {
        assert(c.smallTypeData(1) == 22);
        assert(c.smallTypeData(127) == 2);
        vm.expectRevert();
        c.smallTypeData(128);
    }

    function test_ArrayAccessor_MappingStruct() public view {
        (uint256 a, uint256[] memory arr) = c.multiple_map(2, 1, 2);
        assert(a == 3);
        assert(arr.length == 4);
        assert(arr[3] == 5);
    }
}
