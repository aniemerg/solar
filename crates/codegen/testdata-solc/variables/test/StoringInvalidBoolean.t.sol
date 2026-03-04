// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/StoringInvalidBoolean.sol";

contract StoringInvalidBooleanTest is Test {
    function test_StoringInvalidBoolean() public {
        StoringInvalidBoolean c = new StoringInvalidBoolean();
        assert(c.set() == 1);
        // After storing bool via assembly with value 5, perm should be true
        assert(c.perm() == true);
        // Returning bool via assembly with value 5 should be true
        assert(c.ret() == true);
        // Emitting event returns 1
        vm.expectEmit(true, false, false, false);
        emit StoringInvalidBoolean.Ev(true);
        assert(c.ev() == 1);
    }
}
