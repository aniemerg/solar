// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CreateMemoryByteArray.sol";

contract CreateMemoryByteArrayTest is Test {
    function test_CreateMemoryByteArray() public {
        CreateMemoryByteArray c = new CreateMemoryByteArray();
        assertEq(c.f(), bytes1("A"));
    }
}
