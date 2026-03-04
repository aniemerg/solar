// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/StringAllocationBug.sol";

contract StringAllocationBugTest is Test {
    function test_StringAllocationBug() public {
        StringAllocationBug c = new StringAllocationBug();
        (uint16 x, uint16 y, string memory a, string memory b) = c.p(0);
        assertEq(x, 0xbbbb);
        assertEq(y, 0xcccc);
        assertEq(a, "hello");
        assertEq(b, "world");
    }
}
