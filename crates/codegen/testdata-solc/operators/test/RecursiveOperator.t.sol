// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/RecursiveOperator.sol";

contract RecursiveOperatorTest is Test {
    function test_RecursiveOperator() public {
        C c = new C();
        assert(Uint.unwrap(c.runUnary(Uint.wrap(0))) == 0);
        assert(Uint.unwrap(c.runUnary(Uint.wrap(1))) == 0);
        // runUnary(99999999999) causes infinite recursion -> FAILURE
        vm.expectRevert();
        c.runUnary(Uint.wrap(99999999999));

        assert(Uint.unwrap(c.runBinary(Uint.wrap(0), Uint.wrap(0))) == 0);
        assert(Uint.unwrap(c.runBinary(Uint.wrap(1), Uint.wrap(0))) == 0);
        assert(Uint.unwrap(c.runBinary(Uint.wrap(0), Uint.wrap(1))) == 0);
        assert(Uint.unwrap(c.runBinary(Uint.wrap(1), Uint.wrap(1))) == 0);
        // runBinary(99999999999, 99999999999) causes stack overflow -> FAILURE
        vm.expectRevert();
        c.runBinary(Uint.wrap(99999999999), Uint.wrap(99999999999));
    }
}
