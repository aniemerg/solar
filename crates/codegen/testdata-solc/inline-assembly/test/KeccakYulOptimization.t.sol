// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/KeccakYulOptimization.sol";

contract KeccakYulOptimizationTest is Test {
    KeccakYulOptimization c;

    function setUp() public {
        c = new KeccakYulOptimization();
    }

    // f() -> 0xcdb56c384a9682c600315e3470157a4cf7638d0d33e9dae5c40ffd2644fc5a80
    function test_f() public {
        assertEq(c.f(), 0xcdb56c384a9682c600315e3470157a4cf7638d0d33e9dae5c40ffd2644fc5a80);
    }

    // g() -> 0xcdb56c384a9682c600315e3470157a4cf7638d0d33e9dae5c40ffd2644fc5a80
    function test_g() public {
        assertEq(c.g(), 0xcdb56c384a9682c600315e3470157a4cf7638d0d33e9dae5c40ffd2644fc5a80);
    }
}
