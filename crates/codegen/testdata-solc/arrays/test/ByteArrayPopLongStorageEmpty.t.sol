// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ByteArrayPopLongStorageEmpty.sol";

contract ByteArrayPopLongStorageEmptyTest is Test {
    function test_ByteArrayPopLongStorageEmpty() public {
        ByteArrayPopLongStorageEmpty c = new ByteArrayPopLongStorageEmpty();
        assertEq(c.runTest(), true);
    }
}
