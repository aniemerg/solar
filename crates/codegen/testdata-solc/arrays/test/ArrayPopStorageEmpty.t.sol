// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ArrayPopStorageEmpty.sol";

contract ArrayPopStorageEmptyTest is Test {
    function test_ArrayPopStorageEmpty() public {
        ArrayPopStorageEmpty c = new ArrayPopStorageEmpty();
        c.runTest();
    }
}
