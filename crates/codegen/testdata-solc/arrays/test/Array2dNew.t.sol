// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/Array2dNew.sol";

contract Array2dNewTest is Test {
    function test_Array2dNew() public {
        Array2dNew c = new Array2dNew();
        assertEq(c.f(42), 42);
    }
}
