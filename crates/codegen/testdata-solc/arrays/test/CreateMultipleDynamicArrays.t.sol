// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CreateMultipleDynamicArrays.sol";

contract CreateMultipleDynamicArraysTest is Test {
    function test_CreateMultipleDynamicArrays() public {
        CreateMultipleDynamicArrays c = new CreateMultipleDynamicArrays();
        assertEq(c.f(), 7);
    }
}
