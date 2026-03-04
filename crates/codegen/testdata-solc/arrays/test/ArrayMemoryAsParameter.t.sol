// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ArrayMemoryAsParameter.sol";

contract ArrayMemoryAsParameterTest is Test {
    function test_ArrayMemoryAsParameter() public {
        ArrayMemoryAsParameter c = new ArrayMemoryAsParameter();
        // test(0, 0) -> FAILURE (array out of bounds, panic 0x32)
        vm.expectRevert();
        c.doTest(0, 0);

        assertEq(c.doTest(1, 0), 1);
        assertEq(c.doTest(10, 5), 6);

        // test(10, 50) -> FAILURE (array out of bounds)
        vm.expectRevert();
        c.doTest(10, 50);
    }
}
