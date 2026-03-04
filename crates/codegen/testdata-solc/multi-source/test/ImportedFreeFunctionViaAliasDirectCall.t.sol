// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ImportedFreeFunctionViaAliasDirectCallS2.sol";
contract ImportedFreeFunctionViaAliasDirectCallTest is Test {
    function test_ImportedFreeFunctionViaAliasDirectCall() public {
        D d = new D();
        // g() = f from s1 = 1337, f() in s2 = 6
        // h() = 1337 + 6*10000 = 61337
        assertEq(d.h(), 61337);
    }
}
