// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/FreeNamesakeContractFunction.sol";

contract FreeNamesakeContractFunctionTest is Test {
    function test_FreeNamesakeContractFunction() public {
        FreeNamesakeContractFunction c = new FreeNamesakeContractFunction();
        // f() calls itself recursively (contract f shadows free f), causing stack overflow -> FAILURE
        vm.expectRevert();
        c.f();
    }
}
