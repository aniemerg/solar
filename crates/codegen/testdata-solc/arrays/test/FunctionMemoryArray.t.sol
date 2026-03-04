// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/FunctionMemoryArray.sol";

contract FunctionMemoryArrayTest is Test {
    function test_FunctionMemoryArray() public {
        FunctionMemoryArray c = new FunctionMemoryArray();
        assertEq(c.doTest(10, 0), 11);
        assertEq(c.doTest(10, 1), 12);
        assertEq(c.doTest(10, 2), 13);
        assertEq(c.doTest(10, 3), 15);
        assertEq(c.doTest(10, 4), 18);
        // index 5 -> uninitialized function pointer -> revert
        vm.expectRevert();
        c.doTest(10, 5);
    }
}
