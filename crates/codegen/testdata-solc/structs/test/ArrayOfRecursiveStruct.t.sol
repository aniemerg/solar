// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayOfRecursiveStruct.sol";

contract ArrayOfRecursiveStructTest {
    ArrayOfRecursiveStruct c;

    function setUp() public {
        c = new ArrayOfRecursiveStruct();
    }

    function test_ArrayOfRecursiveStruct() public view {
        c.func();
    }
}
