// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/DeleteOnArrayOfStructs.sol";

contract DeleteOnArrayOfStructsTest is Test {
    function test_DeleteOnArrayOfStructs() public {
        DeleteOnArrayOfStructs c = new DeleteOnArrayOfStructs();
        assertEq(c.f(), true);
    }
}
