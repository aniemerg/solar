// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/DeleteMemoryArray.sol";

contract DeleteMemoryArrayTest is Test {
    function test_DeleteMemoryArray() public {
        DeleteMemoryArray c = new DeleteMemoryArray();
        assertEq(c.len(), 0);
    }
}
