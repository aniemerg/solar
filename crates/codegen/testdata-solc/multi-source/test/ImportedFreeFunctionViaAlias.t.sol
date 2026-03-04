// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ImportedFreeFunctionViaAliasS2.sol";
contract ImportedFreeFunctionViaAliasTest is Test {
    function test_ImportedFreeFunctionViaAlias() public {
        D d = new D();
        // super.g() = M.C.g() = f_s1() = 1337
        // f() in s2 = 6
        // g() = 1337 + 6*10000 = 61337
        assertEq(d.g(), 61337);
    }
}
