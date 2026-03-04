// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/InlineArrayStorageToMemoryConversionStrings.sol";

contract InlineArrayStorageToMemoryConversionStringsTest is Test {
    function test_InlineArrayStorageToMemoryConversionStrings() public {
        InlineArrayStorageToMemoryConversionStrings c = new InlineArrayStorageToMemoryConversionStrings();
        (string memory a, string memory b) = c.f();
        assertEq(a, "ray");
        assertEq(b, "mi");
    }
}
