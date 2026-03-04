// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ExternalFunctionPointerAddressAssignment.sol";

contract ExternalFunctionPointerAddressAssignmentTest is Test {
    ExternalFunctionPointerAddressAssignment c;

    function setUp() public {
        c = new ExternalFunctionPointerAddressAssignment();
    }

    // testYul(address): 0x1234567890 -> 0x1234567890
    function test_testYul_1() public {
        assertEq(c.testYul(address(0x1234567890)), address(0x1234567890));
    }

    // testYul(address): 0xC0FFEE3EA7 -> 0xC0FFEE3EA7
    function test_testYul_2() public {
        assertEq(c.testYul(address(0xC0FFEE3EA7)), address(0xC0FFEE3EA7));
    }
}
