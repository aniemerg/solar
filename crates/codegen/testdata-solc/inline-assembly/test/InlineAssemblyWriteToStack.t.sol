// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/InlineAssemblyWriteToStack.sol";

contract InlineAssemblyWriteToStackTest is Test {
    InlineAssemblyWriteToStack c;

    function setUp() public {
        c = new InlineAssemblyWriteToStack();
    }

    // f() -> 7, "abcdef"
    function test_f() public {
        (uint256 r, bytes32 r2) = c.f();
        assertEq(r, 7);
        assertEq(r2, bytes32("abcdef"));
    }
}
