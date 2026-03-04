// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CallToZeroInitializedFunctionType.sol";
import {Test} from "forge-std/Test.sol";

contract CallToZeroInitializedFunctionTypeTest is Test {
    function test_callZeroInitPanics() public {
        CallToZeroInitializedFunctionType c = new CallToZeroInitializedFunctionType();
        vm.expectRevert();
        c.t();
    }
}
