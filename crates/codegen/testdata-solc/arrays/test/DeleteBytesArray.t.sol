// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/DeleteBytesArray.sol";

contract DeleteBytesArrayTest is Test {
    function test_DeleteBytesArray() public {
        DeleteBytesArray c = new DeleteBytesArray();
        assertEq(c.f(), 0);
        assertEq(c.g(), 0);
    }
}
