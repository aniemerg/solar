// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ByteArrayTransitional2.sol";

contract ByteArrayTransitional2Test is Test {
    function test_ByteArrayTransitional2() public {
        ByteArrayTransitional2 c = new ByteArrayTransitional2();
        assertEq(c.runTest(), 0);
    }
}
