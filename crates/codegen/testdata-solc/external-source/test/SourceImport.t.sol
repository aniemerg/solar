// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/SourceImport.sol";
contract SourceImportTest is Test {
    function test_SourceImport() public {
        C c = new C();
        assertTrue(address(c) != address(0));
    }
}
