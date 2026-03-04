// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventStaticCalldataUintArrayAndDynamicArray.sol";

contract EventStaticCalldataUintArrayAndDynamicArrayTest is Test {
    EventStaticCalldataUintArrayAndDynamicArray c;

    function setUp() public {
        c = new EventStaticCalldataUintArrayAndDynamicArray();
    }

    function test_f() public {
        // f(uint256[],uint256[1]): 0x40, 0xff, 1, 0xffff -> emit E([0xff], [0xffff])
        uint[] memory dynA = new uint[](1);
        dynA[0] = 0xff;
        uint[1] memory staticB;
        staticB[0] = 0xffff;

        uint[] memory expA = new uint[](1);
        expA[0] = 0xff;
        uint[1] memory expB;
        expB[0] = 0xffff;

        vm.expectEmit(false, false, false, true);
        emit EventStaticCalldataUintArrayAndDynamicArray.E(expA, expB);
        c.f(dynA, staticB);
    }
}
