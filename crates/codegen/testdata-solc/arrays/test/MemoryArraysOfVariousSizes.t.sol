// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/MemoryArraysOfVariousSizes.sol";

contract MemoryArraysOfVariousSizesTest is Test {
    function test_MemoryArraysOfVariousSizes() public {
        MemoryArraysOfVariousSizes c = new MemoryArraysOfVariousSizes();
        assertEq(c.f(3, 1), 1);
        assertEq(c.f(9, 5), 70);
    }
}
