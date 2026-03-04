// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/InlineAssemblyStorageAccess.sol";

contract InlineAssemblyStorageAccessTest is Test {
    InlineAssemblyStorageAccess c;

    function setUp() public {
        c = new InlineAssemblyStorageAccess();
    }

    // f() -> true
    // z() -> 7 (after f() sets z=7)
    function test_f_and_z() public {
        assertEq(c.f(), true);
        assertEq(c.z(), 7);
    }
}
