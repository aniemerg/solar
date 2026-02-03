// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ArrayStoragePopZeroLength.sol";

contract ArrayStoragePopZeroLengthTest is Test {
    ArrayStoragePopZeroLength c;

    function setUp() public {
        c = new ArrayStoragePopZeroLength();
    }

    function test_ArrayStoragePopZeroLength() public {
        vm.expectRevert();
        c.popEmpty();
    }
}
