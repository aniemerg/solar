// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/InlineAssemblyFunctionCall2.sol";

contract InlineAssemblyFunctionCall2Test is Test {
    InlineAssemblyFunctionCall2 c;

    function setUp() public {
        c = new InlineAssemblyFunctionCall2();
    }

    // f() -> 0x1, 0x2, 0x7, 0x10
    function test_f() public {
        (uint a1, uint b1, uint c1, uint d) = c.f();
        assertEq(a1, 1);
        assertEq(b1, 2);
        assertEq(c1, 7);
        assertEq(d, 0x10);
    }
}
