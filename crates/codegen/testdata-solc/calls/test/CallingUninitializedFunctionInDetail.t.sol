// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/CallingUninitializedFunctionInDetail.sol";

contract CallingUninitializedFunctionInDetailTest is Test {
    CallingUninitializedFunctionInDetail c;

    function setUp() public {
        c = new CallingUninitializedFunctionInDetail();
    }

    function test_t_reverts() public {
        vm.expectRevert();
        c.t();
    }
}
