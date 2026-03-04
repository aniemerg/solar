// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/BytesConcatNested.sol";

contract BytesConcatNestedTest is Test {
    function test_BytesConcatNested() public {
        BytesConcatNested c = new BytesConcatNested();
        // f(a="ab", b="ab", c="ab") -> "ababab"
        bytes memory result = c.f("ab", "ab", "ab");
        assertEq(result.length, 6);
        assertEq(result, "ababab");
    }
}
