// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/AccessorsMappingForArray.sol";

contract AccessorsMappingForArrayTest is Test {
    AccessorsMappingForArray c;

    function setUp() public {
        c = new AccessorsMappingForArray();
    }

    function test_AccessorsMappingForArray() public {
        assert(c.data(2, 2) == 8);
        vm.expectRevert();
        c.data(2, 8);
        assert(c.dynamicData(2, 2) == 8);
        vm.expectRevert();
        c.dynamicData(2, 8);
    }
}
