// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionDeleteStorage.sol";
import {Test} from "forge-std/Test.sol";

contract FunctionDeleteStorageTest is Test {
    function test_deleteStorage() public {
        FunctionDeleteStorage c = new FunctionDeleteStorage();
        assert(c.set() == 7);
        assert(c.ca() == 7);
        assert(c.d() == 1);
        vm.expectRevert();
        c.ca();
    }
}
