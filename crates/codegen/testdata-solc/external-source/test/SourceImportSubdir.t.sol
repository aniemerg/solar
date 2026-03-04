// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/SourceImportSubdir.sol";
contract SourceImportSubdirTest is Test {
    function test_SourceImportSubdir() public {
        C c = new C();
        assertTrue(address(c) != address(0));
    }
}
