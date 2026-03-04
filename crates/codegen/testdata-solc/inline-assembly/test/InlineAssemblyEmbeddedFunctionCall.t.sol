// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/InlineAssemblyEmbeddedFunctionCall.sol";

contract InlineAssemblyEmbeddedFunctionCallTest is Test {
    InlineAssemblyEmbeddedFunctionCall c;

    function setUp() public {
        c = new InlineAssemblyEmbeddedFunctionCall();
    }

    // f() -> 0x1, 0x4, 0x7, 0x10
    function test_f() public {
        (uint a1, uint b1, uint c1, uint d) = c.f();
        assertEq(a1, 1);
        assertEq(b1, 4);
        assertEq(c1, 7);
        assertEq(d, 0x10);
    }
}
