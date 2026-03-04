// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/PushNoArgs1d.sol";

contract PushNoArgs1dTest is Test {
    function test_PushNoArgs1d() public {
        PushNoArgs1d c = new PushNoArgs1d();
        assertEq(c.l(), 0);
        c.lv(42);
        assertEq(c.l(), 1);
        assertEq(c.a(0), 42);
        assertEq(c.f(), 0);
        assertEq(c.l(), 2);
        assertEq(c.a(1), 0);
        c.lv(111);
        assertEq(c.l(), 3);
        assertEq(c.a(2), 111);
    }
}
