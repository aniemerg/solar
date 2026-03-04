// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/InlineAssemblyTransientStorageAccessInsideFunction.sol";

contract InlineAssemblyTransientStorageAccessInsideFunctionTest is Test {
    InlineAssemblyTransientStorageAccessInsideFunction c;

    function setUp() public {
        c = new InlineAssemblyTransientStorageAccessInsideFunction();
    }

    // f() -> 7
    function test_f() public {
        assertEq(c.f(), 7);
    }
}
