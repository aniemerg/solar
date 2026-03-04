// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/TransientStorageResetBetweenCreationRuntime.sol";

contract TransientStorageResetBetweenCreationRuntimeTest is Test {
    TransientStorageResetBetweenCreationRuntime c;

    function setUp() public {
        c = new TransientStorageResetBetweenCreationRuntime();
    }

    // constructor() ->  (stores 42 in transient, asserts == 42)
    // f() -> 0 (transient storage reset between creation and runtime)
    function test_f() public {
        // Constructor already ran, transient storage is reset
        assertEq(c.f(), 0);
    }
}
