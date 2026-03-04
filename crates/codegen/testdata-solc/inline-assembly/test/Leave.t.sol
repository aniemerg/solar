// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/Leave.sol";

contract LeaveTest is Test {
    Leave c;

    function setUp() public {
        c = new Leave();
    }

    // f() -> 2
    function test_f() public {
        assertEq(c.f(), 2);
    }
}
