// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/Truefalse.sol";

contract TruefalseTest is Test {
    Truefalse c;

    function setUp() public {
        c = new Truefalse();
    }

    // f() -> 1, 0
    function test_f() public {
        (uint x, uint y) = c.f();
        assertEq(x, 1);
        assertEq(y, 0);
    }
}
