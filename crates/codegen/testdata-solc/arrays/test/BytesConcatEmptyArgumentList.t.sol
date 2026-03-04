// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/BytesConcatEmptyArgumentList.sol";

contract BytesConcatEmptyArgumentListTest is Test {
    function test_BytesConcatEmptyArgumentList() public {
        BytesConcatEmptyArgumentList c = new BytesConcatEmptyArgumentList();
        bytes memory result = c.f();
        assertEq(result.length, 0);
    }
}
