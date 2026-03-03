// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/InvalidEnumLogged.sol";

contract InvalidEnumLoggedTest is Test {
    InvalidEnumLogged c;

    function setUp() public {
        c = new InvalidEnumLogged();
    }

    function test_InvalidEnumLogged_ok() public {
        assert(c.test_log_ok() == 1);
    }

    function test_InvalidEnumLogged_garbled() public {
        vm.expectRevert();
        c.test_log();
    }
}
