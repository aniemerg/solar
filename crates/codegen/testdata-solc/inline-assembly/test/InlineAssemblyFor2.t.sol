// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/InlineAssemblyFor2.sol";

contract InlineAssemblyFor2Test is Test {
    InlineAssemblyFor2 c;

    function setUp() public {
        c = new InlineAssemblyFor2();
    }

    // f(uint256): 0 -> 0, 2, 0
    function test_f_0() public {
        (uint b, uint cv, uint d) = c.f(0);
        assertEq(b, 0);
        assertEq(cv, 2);
        assertEq(d, 0);
    }

    // f(uint256): 1 -> 1, 4, 3
    function test_f_1() public {
        (uint b, uint cv, uint d) = c.f(1);
        assertEq(b, 1);
        assertEq(cv, 4);
        assertEq(d, 3);
    }

    // f(uint256): 2 -> 0, 2, 0
    function test_f_2() public {
        (uint b, uint cv, uint d) = c.f(2);
        assertEq(b, 0);
        assertEq(cv, 2);
        assertEq(d, 0);
    }
}
