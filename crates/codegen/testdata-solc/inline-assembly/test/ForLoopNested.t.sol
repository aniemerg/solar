// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ForLoopNested.sol";

contract ForLoopNestedTest is Test {
    ForLoopNested c;

    function setUp() public {
        c = new ForLoopNested();
    }

    // f(uint256): 0 -> 2
    function test_f_0() public {
        assertEq(c.f(0), 2);
    }

    // f(uint256): 1 -> 18
    function test_f_1() public {
        assertEq(c.f(1), 18);
    }

    // f(uint256): 2 -> 10
    function test_f_2() public {
        assertEq(c.f(2), 10);
    }

    // f(uint256): 4 -> 91
    function test_f_4() public {
        assertEq(c.f(4), 91);
    }
}
