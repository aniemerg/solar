// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ExternalCallToNonexistingDebugstrings.sol";

contract ExternalCallToNonexistingDebugstringsTest is Test {
    ExternalCallToNonexistingDebugstrings c;

    function setUp() public {
        c = new ExternalCallToNonexistingDebugstrings{value: 1 ether}();
    }

    function test_f0_reverts() public {
        vm.expectRevert();
        c.f(0);
    }

    function test_f1_reverts() public {
        vm.expectRevert();
        c.f(1);
    }

    function test_f2_reverts() public {
        vm.expectRevert();
        c.f(2);
    }

    function test_f3_reverts() public {
        vm.expectRevert();
        c.f(3);
    }

    function test_f4_reverts() public {
        vm.expectRevert();
        c.f(4);
    }

    function test_f5_reverts() public {
        vm.expectRevert();
        c.f(5);
    }

    function test_f6_returns_7() public {
        assert(c.f(6) == 7);
    }
}
