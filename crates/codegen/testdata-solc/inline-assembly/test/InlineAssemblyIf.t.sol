// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/InlineAssemblyIf.sol";

contract InlineAssemblyIfTest is Test {
    InlineAssemblyIf c;

    function setUp() public {
        c = new InlineAssemblyIf();
    }

    // f(uint256): 0 -> 0
    function test_f_0() public { assertEq(c.f(0), 0); }

    // f(uint256): 1 -> 0
    function test_f_1() public { assertEq(c.f(1), 0); }

    // f(uint256): 2 -> 2
    function test_f_2() public { assertEq(c.f(2), 2); }

    // f(uint256): 3 -> 2
    function test_f_3() public { assertEq(c.f(3), 2); }
}
