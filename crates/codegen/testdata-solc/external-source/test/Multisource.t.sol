// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/MultisourceS2.sol";
contract MultisourceTest is Test {
    function test_Multisource() public {
        C c = new C();
        assertTrue(address(c) != address(0));
    }
}
