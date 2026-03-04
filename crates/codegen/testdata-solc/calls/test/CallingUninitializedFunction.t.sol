// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/CallingUninitializedFunction.sol";

contract CallingUninitializedFunctionTest is Test {
    CallingUninitializedFunction c;

    function setUp() public {
        c = new CallingUninitializedFunction();
    }

    function test_intern_reverts() public {
        vm.expectRevert();
        c.intern();
    }

    function test_extern_reverts() public {
        vm.expectRevert();
        c.extern_func();
    }
}
