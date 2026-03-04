// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionDeleteStack.sol";
import {Test} from "forge-std/Test.sol";

contract FunctionDeleteStackTest is Test {
    function test_deleteStackPanics() public {
        FunctionDeleteStack c = new FunctionDeleteStack();
        vm.expectRevert();
        c.run();
    }
}
