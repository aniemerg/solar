// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ForLoopBreak.sol";

contract ForLoopBreakTest is Test {
    ForLoopBreak c;

    function setUp() public {
        c = new ForLoopBreak();
    }

    // f() -> 6
    function test_f() public {
        assertEq(c.f(), 6);
    }
}
