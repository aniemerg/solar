// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/InlineAssemblySwitch.sol";

contract InlineAssemblySwitchTest is Test {
    InlineAssemblySwitch c;

    function setUp() public {
        c = new InlineAssemblySwitch();
    }

    // f(uint256): 0 -> 2
    function test_f_0() public { assertEq(c.f(0), 2); }

    // f(uint256): 1 -> 8
    function test_f_1() public { assertEq(c.f(1), 8); }

    // f(uint256): 2 -> 9
    function test_f_2() public { assertEq(c.f(2), 9); }

    // f(uint256): 3 -> 2
    function test_f_3() public { assertEq(c.f(3), 2); }
}
