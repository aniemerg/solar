// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/TstoreHiddenStaticcall.sol";

contract TstoreHiddenStaticcallTest is Test {
    TstoreHiddenStaticcall c;

    function setUp() public {
        c = new TstoreHiddenStaticcall();
    }

    // test() -> FAILURE
    // g() is declared view, so external call uses staticcall
    // But g() internally calls f() which does tstore -> reverts
    function test_test() public {
        vm.expectRevert();
        c.callG();
    }
}
