// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ExternalFunctionPointerAddress.sol";

contract ExternalFunctionPointerAddressTest is Test {
    ExternalFunctionPointerAddress c;

    function setUp() public {
        c = new ExternalFunctionPointerAddress();
    }

    // testYul() -> 0x1234
    function test_testYul() public {
        assertEq(c.testYul(), address(0x1234));
    }

    // testSol() -> 0x1234
    function test_testSol() public {
        assertEq(c.testSol(), address(0x1234));
    }
}
