// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UninitializedInternalStorageFunctionCall.sol";
import {Test} from "forge-std/Test.sol";

contract UninitializedInternalStorageFunctionCallTest is Test {
    function test_uninitializedCallPanics() public {
        UninitializedInternalStorageFunctionCall c = new UninitializedInternalStorageFunctionCall();
        vm.expectRevert();
        c.f();
    }
}
