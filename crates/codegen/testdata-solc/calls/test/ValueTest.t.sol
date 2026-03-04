// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ValueTest.sol";

contract ValueTestTest is Test {
    ValueTest c;

    function setUp() public {
        c = new ValueTest();
        vm.deal(address(this), 10 ether);
    }

    function test_f_with_1_ether() public {
        assert(c.f{value: 1 ether}() == 1 ether);
    }

    function test_f_with_1_wei() public {
        assert(c.f{value: 1 wei}() == 1 wei);
    }
}
