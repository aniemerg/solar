// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/PushNoArgs2d.sol";

contract PushNoArgs2dTest is Test {
    function test_PushNoArgs2d() public {
        PushNoArgs2d c = new PushNoArgs2d();
        assertEq(c.l(), 0);
        c.f(42, 64);
        assertEq(c.l(), 1);
        assertEq(c.ll(0), 43);
        assertEq(c.a(0, 42), 64);
        c.f(84, 128);
        assertEq(c.l(), 2);
        assertEq(c.ll(1), 85);
        assertEq(c.a(0, 42), 64);
        assertEq(c.a(1, 84), 128);
        c.lv(512);
        assertEq(c.a(2, 0), 512);
    }
}
