// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/DeleteStorageArray.sol";

contract DeleteStorageArrayTest is Test {
    function test_DeleteStorageArray() public {
        DeleteStorageArray c = new DeleteStorageArray();
        assertEq(c.len(), 0);
        assertEq(c.val(), 0);
    }
}
