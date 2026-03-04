// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ByteArrayPopIsolated.sol";

contract ByteArrayPopIsolatedTest is Test {
    function test_ByteArrayPopIsolated() public {
        ByteArrayPopIsolated c = new ByteArrayPopIsolated();
        assertEq(c.runTest(), 3);
    }
}
