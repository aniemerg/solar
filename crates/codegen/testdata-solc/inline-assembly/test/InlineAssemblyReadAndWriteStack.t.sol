// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/InlineAssemblyReadAndWriteStack.sol";

contract InlineAssemblyReadAndWriteStackTest is Test {
    InlineAssemblyReadAndWriteStack c;

    function setUp() public {
        c = new InlineAssemblyReadAndWriteStack();
    }

    // f() -> 45 (0+1+2+...+9 = 45)
    function test_f() public {
        assertEq(c.f(), 45);
    }
}
