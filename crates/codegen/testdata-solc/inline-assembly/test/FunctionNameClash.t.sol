// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/FunctionNameClash.sol";

contract FunctionNameClashTest is Test {
    FunctionNameClash c;

    function setUp() public {
        c = new FunctionNameClash();
    }

    // f() -> 1
    function test_f() public {
        assertEq(c.f(), 1);
    }

    // g() -> 2
    function test_g() public {
        assertEq(c.g(), 2);
    }
}
