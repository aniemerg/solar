// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/BaseAccessToFunctionTypeVariables.sol";

contract BaseAccessToFunctionTypeVariablesTest is Test {
    C c;

    function setUp() public {
        c = new C();
    }

    function test_BaseAccessToFunctionTypeVariables() public {
        assert(c.g() == 2);
        // h() before set() should panic (uninitialized function pointer)
        vm.expectRevert();
        c.h();
        c.set();
        assert(c.h() == 2);
    }
}
