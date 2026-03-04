// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/Memory.sol";

contract MemoryTest is Test {
    function test_Memory() public {
        Memory c = new Memory();
        uint[4] memory n = [uint(1), 2, 3, 4];
        assertEq(c.h(n), 10);
        assertEq(c.i(n), 20);
    }
}
