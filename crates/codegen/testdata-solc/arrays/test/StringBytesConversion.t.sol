// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/StringBytesConversion.sol";

contract StringBytesConversionTest is Test {
    function test_StringBytesConversion() public {
        StringBytesConversion c = new StringBytesConversion();
        // f("abcdef", 2) -> 'c'
        assertEq(c.f("abcdef", 2), bytes1("c"));
        // l() -> 6
        assertEq(c.l(), 6);
    }
}
