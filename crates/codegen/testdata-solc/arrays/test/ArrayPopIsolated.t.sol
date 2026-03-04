// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ArrayPopIsolated.sol";

contract ArrayPopIsolatedTest is Test {
    function test_ArrayPopIsolated() public {
        ArrayPopIsolated c = new ArrayPopIsolated();
        assertEq(c.runTest(), 3);
    }
}
