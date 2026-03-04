// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/OptimizeMemoryStoreMultiBlock.sol";

contract OptimizeMemoryStoreMultiBlockTest is Test {
    OptimizeMemoryStoreMultiBlock c;

    function setUp() public {
        c = new OptimizeMemoryStoreMultiBlock();
    }

    // f() -> 0x42
    function test_f() public {
        assertEq(c.f(), 0x42);
    }

    // g() -> true
    function test_g() public {
        assertEq(c.g(), true);
    }
}
