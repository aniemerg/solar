// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ImportB.sol";
contract ImportTest is Test {
    function test_Import() public {
        B c = new B();
        assertEq(c.f(1337), 1337);
        assertEq(c.g(1337), 1338);
    }
}
