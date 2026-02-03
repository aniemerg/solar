// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/SimpleThrow.sol";

contract SimpleThrowTest is Test {
    SimpleThrow c;

    function setUp() public {
        c = new SimpleThrow();
    }

    function test_SimpleThrow() public {
        assert(c.f(11) == 21);
        vm.expectRevert();
        c.f(1);
    }
}
