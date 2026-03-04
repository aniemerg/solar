// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/Keccak256OptimizerBugDifferentMemoryLocation.sol";

contract Keccak256OptimizerBugDifferentMemoryLocationTest is Test {
    Keccak256OptimizerBugDifferentMemoryLocation c;

    function setUp() public {
        c = new Keccak256OptimizerBugDifferentMemoryLocation();
    }

    // f() -> false
    // keccak256(0,4) != keccak256(0x20,8) even if mem[0]==mem[0x20]
    function test_f() public {
        assertEq(c.f(), false);
    }
}
