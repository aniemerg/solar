// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/Array3dNew.sol";

contract Array3dNewTest is Test {
    function test_Array3dNew() public {
        Array3dNew c = new Array3dNew();
        assertEq(c.f(42), 42);
    }
}
