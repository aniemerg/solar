// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/InvalidEnumStored.sol";

contract InvalidEnumStoredTest is Test {
    InvalidEnumStored c;

    function setUp() public {
        c = new InvalidEnumStored();
    }

    function test_store_ok() public {
        assert(c.store_ok() == 1);
        // After store_ok, x == X.A == 0
        assert(uint(c.x()) == 0);
    }

    function test_store_invalid() public {
        // Storing out-of-range enum triggers Panic(0x21)
        vm.expectRevert();
        c.store_invalid();
    }
}
