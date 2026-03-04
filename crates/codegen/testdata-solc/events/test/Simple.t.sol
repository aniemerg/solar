// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/Simple.sol";

contract SimpleTest is Test {
    Simple c;

    function setUp() public {
        c = new Simple();
    }

    function test_f() public {
        vm.expectEmit(false, false, false, false);
        emit C.E();
        vm.expectEmit(false, false, false, true);
        emit Simple.E(1, 2);
        c.f();
    }
}
