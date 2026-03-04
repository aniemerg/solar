// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CreateMemoryArrayTooLarge.sol";

contract CreateMemoryArrayTooLargeTest is Test {
    function test_CreateMemoryArrayTooLarge() public {
        CreateMemoryArrayTooLarge c = new CreateMemoryArrayTooLarge();
        // Both should revert with panic(0x41) - too-large memory allocation
        vm.expectRevert();
        c.f();

        vm.expectRevert();
        c.g();
    }
}
