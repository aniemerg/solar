// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/InlineArrayStringsFromDocument.sol";

contract InlineArrayStringsFromDocumentTest is Test {
    function test_InlineArrayStringsFromDocument() public {
        InlineArrayStringsFromDocument c = new InlineArrayStringsFromDocument();
        assertEq(c.f(0), "This");
        assertEq(c.f(1), "is");
        assertEq(c.f(2), "an");
        assertEq(c.f(3), "array");
    }
}
