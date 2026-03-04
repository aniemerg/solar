// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/Source.sol";
contract SourceTest is Test {
    function test_Source() public {
        C c = new C();
        // constructor() succeeds
        assertTrue(address(c) != address(0));
    }
}
