// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/InlineAssemblyStorageAccessInsideFunction.sol";

contract InlineAssemblyStorageAccessInsideFunctionTest is Test {
    InlineAssemblyStorageAccessInsideFunction c;

    function setUp() public {
        c = new InlineAssemblyStorageAccessInsideFunction();
    }

    // f() -> true
    // z() -> 7
    function test_f_and_z() public {
        assertEq(c.f(), true);
        assertEq(c.z(), 7);
    }
}
