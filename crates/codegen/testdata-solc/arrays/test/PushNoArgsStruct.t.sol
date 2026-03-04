// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/PushNoArgsStruct.sol";

contract PushNoArgsStructTest is Test {
    function test_PushNoArgsStruct() public {
        PushNoArgsStruct c = new PushNoArgsStruct();
        assertEq(c.l(), 0);
        c.f(42);
        assertEq(c.l(), 1);
        assertEq(c.a(0), 42);
        c.h(84);
        assertEq(c.l(), 2);
        assertEq(c.a(1), 84);
        c.lv(4096);
        assertEq(c.l(), 3);
        assertEq(c.a(2), 4096);
    }
}
