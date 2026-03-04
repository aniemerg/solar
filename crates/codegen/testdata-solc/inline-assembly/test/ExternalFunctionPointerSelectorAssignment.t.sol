// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ExternalFunctionPointerSelectorAssignment.sol";

contract ExternalFunctionPointerSelectorAssignmentTest is Test {
    ExternalFunctionPointerSelectorAssignment c;

    function setUp() public {
        c = new ExternalFunctionPointerSelectorAssignment();
    }

    // testYul(uint32): 0x12345678 -> 0x12345678
    function test_testYul_1() public {
        assertEq(c.testYul(0x12345678), 0x12345678);
    }

    // testYul(uint32): 0xABCDEF00 -> 0xABCDEF00
    function test_testYul_2() public {
        assertEq(c.testYul(0xABCDEF00), 0xABCDEF00);
    }
}
