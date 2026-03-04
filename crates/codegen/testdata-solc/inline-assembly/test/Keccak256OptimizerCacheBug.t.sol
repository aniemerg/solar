// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/Keccak256OptimizerCacheBug.sol";

contract Keccak256OptimizerCacheBugTest is Test {
    Keccak256OptimizerCacheBug c;

    function setUp() public {
        c = new Keccak256OptimizerCacheBug();
    }

    // val() -> true
    function test_val() public {
        assertEq(c.val(), true);
    }
}
