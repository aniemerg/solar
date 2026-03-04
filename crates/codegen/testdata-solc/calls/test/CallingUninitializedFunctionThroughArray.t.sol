// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/CallingUninitializedFunctionThroughArray.sol";

contract CallingUninitializedFunctionThroughArrayTest is Test {
    CallingUninitializedFunctionThroughArray c;

    function setUp() public {
        c = new CallingUninitializedFunctionThroughArray();
    }

    function test_t_reverts() public {
        vm.expectRevert();
        c.t();
    }
}
