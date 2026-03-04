// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/StructFunction.sol";

contract StructFunctionTest is Test {
    StructFunction c;

    function setUp() public {
        c = new StructFunction();
    }

    function test_test() public {
        // test() -> 7, 3
        (uint a, uint b) = c.test();
        assertEq(a, 7);
        assertEq(b, 3);
    }
}
