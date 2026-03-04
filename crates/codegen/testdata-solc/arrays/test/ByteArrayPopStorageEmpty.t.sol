// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ByteArrayPopStorageEmpty.sol";

contract ByteArrayPopStorageEmptyTest is Test {
    function test_ByteArrayPopStorageEmpty() public {
        ByteArrayPopStorageEmpty c = new ByteArrayPopStorageEmpty();
        c.runTest();
    }
}
