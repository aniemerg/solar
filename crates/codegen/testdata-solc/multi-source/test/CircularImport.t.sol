// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CircularImportS2.sol";
contract CircularImportTest is Test {
    function test_CircularImport() public {
        C c = new C();
        // f() - g() = 2 - 1 = 1
        assertEq(c.foo(), 1);
    }
}
