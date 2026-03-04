// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/InlineAssemblyRecursion.sol";

contract InlineAssemblyRecursionTest is Test {
    InlineAssemblyRecursion c;

    function setUp() public {
        c = new InlineAssemblyRecursion();
    }

    // f(uint256): 0 -> 1
    function test_f_0() public { assertEq(c.f(0), 1); }

    // f(uint256): 1 -> 1
    function test_f_1() public { assertEq(c.f(1), 1); }

    // f(uint256): 2 -> 2
    function test_f_2() public { assertEq(c.f(2), 2); }

    // f(uint256): 3 -> 6
    function test_f_3() public { assertEq(c.f(3), 6); }

    // f(uint256): 4 -> 24
    function test_f_4() public { assertEq(c.f(4), 24); }
}
