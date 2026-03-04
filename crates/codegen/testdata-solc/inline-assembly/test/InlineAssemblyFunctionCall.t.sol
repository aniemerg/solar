// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/InlineAssemblyFunctionCall.sol";

contract InlineAssemblyFunctionCallTest is Test {
    InlineAssemblyFunctionCall c;

    function setUp() public {
        c = new InlineAssemblyFunctionCall();
    }

    // f() -> 1, 2, 7
    function test_f() public {
        (uint a1, uint b1, uint c1) = c.f();
        assertEq(a1, 1);
        assertEq(b1, 2);
        assertEq(c1, 7);
    }
}
