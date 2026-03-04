// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ByteArrayPop.sol";

contract ByteArrayPopTest is Test {
    function test_ByteArrayPop() public {
        ByteArrayPop c = new ByteArrayPop();
        (uint256 x, uint256 y, uint256 l) = c.runTest();
        assertEq(x, 2);
        assertEq(y, 1);
        assertEq(l, 1);
    }
}
