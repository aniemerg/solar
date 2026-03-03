// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/SmallErrorOptimization.sol";

contract SmallErrorOptimizationTest is Test {
    SmallErrorOptimization c;

    function setUp() public {
        c = new SmallErrorOptimization();
    }

    function test_SmallErrorOptimization() public {
        // f() -> FAILURE, hex"92bbf6e8"
        // E() selector = keccak256("E()")[0:4] = 0x92bbf6e8
        vm.expectRevert(abi.encodeWithSelector(bytes4(0x92bbf6e8)));
        c.f();
    }
}
