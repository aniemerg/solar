// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StringConcatEmptyArgumentList.sol";

contract StringConcatEmptyArgumentListTest {
    StringConcatEmptyArgumentList c;

    function setUp() public {
        c = new StringConcatEmptyArgumentList();
    }

    function test_StringConcatEmptyArgumentList() public view {
        assert(bytes(c.f()).length == 0);
    }
}
