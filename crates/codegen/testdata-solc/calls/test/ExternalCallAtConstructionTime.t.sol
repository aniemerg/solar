// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ExternalCallAtConstructionTime.sol";

contract ExternalCallAtConstructionTimeTest is Test {
    ExternalCallAtConstructionTime c;

    function setUp() public {
        c = new ExternalCallAtConstructionTime();
    }

    function test_f0_reverts() public {
        // Deploying T reverts: this.f() during construction fails extcodesize check
        vm.expectRevert();
        c.f(0);
    }

    function test_f1_reverts() public {
        // Deploying U reverts: this.f() during construction fails extcodesize check
        vm.expectRevert();
        c.f(1);
    }

    function test_f2_returns_3() public {
        assert(c.f(2) == 3);
    }
}
