// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/Keccak256Assembly.sol";

contract Keccak256AssemblyTest is Test {
    Keccak256Assembly c;

    function setUp() public {
        c = new Keccak256Assembly();
    }

    // f() -> 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470
    // keccak256 of empty input
    function test_f() public {
        assertEq(c.f(), 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470);
    }
}
