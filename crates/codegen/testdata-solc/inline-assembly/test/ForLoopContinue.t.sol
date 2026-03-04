// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ForLoopContinue.sol";

contract ForLoopContinueTest is Test {
    ForLoopContinue c;

    function setUp() public {
        c = new ForLoopContinue();
    }

    // f() -> 5
    function test_f() public {
        assertEq(c.f(), 5);
    }
}
