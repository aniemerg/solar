// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/Keccak256Optimization.sol";

contract Keccak256OptimizationTest is Test {
    Keccak256Optimization c;

    function setUp() public {
        c = new Keccak256Optimization();
    }

    // f() -> true
    // calldataload(0) loads from position 0 of calldata = the selector (same for both)
    // Both a and b hash the same 4-byte value -> equal
    function test_f() public {
        assertEq(c.f(), true);
    }
}
