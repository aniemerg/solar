// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ReimportImportedFunctionS3.sol";
contract ReimportImportedFunctionTest is Test {
    function test_ReimportImportedFunction() public {
        C c = new C();
        assertEq(c.foo(), 1337);
    }
}
