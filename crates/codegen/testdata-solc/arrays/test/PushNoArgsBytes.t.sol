// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/PushNoArgsBytes.sol";

contract PushNoArgsBytesTest is Test {
    function test_PushNoArgsBytes() public {
        PushNoArgsBytes c = new PushNoArgsBytes();
        assertEq(c.l(), 0);
        c.g(70);
        assertEq(c.l(), 70);
        assertEq(c.a(69), bytes1(uint8(69)));
        c.f();
        assertEq(c.l(), 71);
        assertEq(c.a(70), bytes1(0));
    }
}
