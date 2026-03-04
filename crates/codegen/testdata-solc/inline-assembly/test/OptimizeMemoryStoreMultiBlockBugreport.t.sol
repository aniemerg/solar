// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/OptimizeMemoryStoreMultiBlockBugreport.sol";

contract OptimizeMemoryStoreMultiBlockBugreportTest is Test {
    OptimizeMemoryStoreMultiBlockBugreport c;

    function setUp() public {
        c = new OptimizeMemoryStoreMultiBlockBugreport();
    }

    // test() -> 10 (0 + 5 + 5 = 10)
    // Also emits an anonymous event
    function test_test() public {
        assertEq(c.test(), 10);
    }
}
