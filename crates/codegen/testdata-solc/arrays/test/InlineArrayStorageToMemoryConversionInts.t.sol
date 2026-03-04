// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/InlineArrayStorageToMemoryConversionInts.sol";

contract InlineArrayStorageToMemoryConversionIntsTest is Test {
    function test_InlineArrayStorageToMemoryConversionInts() public {
        InlineArrayStorageToMemoryConversionInts c = new InlineArrayStorageToMemoryConversionInts();
        (uint256 x, uint256 y) = c.f();
        assertEq(x, 3);
        assertEq(y, 6);
    }
}
