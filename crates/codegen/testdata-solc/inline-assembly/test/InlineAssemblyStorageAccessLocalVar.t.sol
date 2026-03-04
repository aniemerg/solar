// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/InlineAssemblyStorageAccessLocalVar.sol";

contract InlineAssemblyStorageAccessLocalVarTest is Test {
    InlineAssemblyStorageAccessLocalVar c;

    function setUp() public {
        c = new InlineAssemblyStorageAccessLocalVar();
    }

    // f() -> 7 (a.length after sstore sets slot 0 to 7)
    function test_f() public {
        assertEq(c.f(), 7);
    }
}
