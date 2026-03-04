// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/CheckVarInit.sol";

contract CheckVarInitTest is Test {
    CheckVarInit c;

    function setUp() public {
        c = new CheckVarInit();
    }

    function test_CheckVarInit_f_Reverts() public {
        // Constructing C() with 0 value causes msg.value - 10 to overflow (panic 0x11)
        vm.expectRevert();
        c.f();
    }

    function test_CheckVarInit_g() public {
        vm.deal(address(this), 100 wei);
        uint result = c.g{value: 100 wei}();
        assert(result == 1);
    }
}
