// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ArrayMemoryCreate.sol";

contract ArrayMemoryCreateTest is Test {
    function test_ArrayMemoryCreate() public {
        ArrayMemoryCreate c = new ArrayMemoryCreate();
        assertEq(c.create(0), 0);
        assertEq(c.create(7), 7);
        assertEq(c.create(10), 10);
    }
}
