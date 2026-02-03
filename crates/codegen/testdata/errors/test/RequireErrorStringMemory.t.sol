// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/RequireErrorStringMemory.sol";

contract RequireErrorStringMemoryTest is Test {
    RequireErrorStringMemory c;

    function setUp() public {
        c = new RequireErrorStringMemory();
    }

    function test_RequireErrorStringMemory_f() public {
        vm.expectRevert(abi.encodeWithSelector(CustomErrorStringMem.selector, "errorReason"));
        c.f();
    }

    function test_RequireErrorStringMemory_g() public {
        vm.expectRevert(abi.encodeWithSelector(CustomErrorStringMem.selector, "anotherReason"));
        c.g();
    }
}
