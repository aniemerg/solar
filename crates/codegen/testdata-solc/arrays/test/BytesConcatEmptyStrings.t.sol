// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/BytesConcatEmptyStrings.sol";

contract BytesConcatEmptyStringsTest is Test {
    function test_BytesConcatEmptyStrings_f() public {
        BytesConcatEmptyStrings c = new BytesConcatEmptyStrings();
        bytes memory result = c.f();
        assertEq(result.length, 0);
    }

    function test_BytesConcatEmptyStrings_g() public {
        BytesConcatEmptyStrings c = new BytesConcatEmptyStrings();
        bytes memory result = c.g();
        assertEq(result.length, 6);
        assertEq(result, "abcabc");
    }

    function test_BytesConcatEmptyStrings_h() public {
        BytesConcatEmptyStrings c = new BytesConcatEmptyStrings();
        bytes memory result = c.h();
        assertEq(result.length, 6);
        assertEq(result, "abcabc");
    }
}
