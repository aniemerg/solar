// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ArrayPopParenthesized.sol";

contract ArrayPopParenthesizedTest is Test {
    function test_ArrayPopParenthesized() public {
        ArrayPopParenthesized c = new ArrayPopParenthesized();
        assertEq(c.f(), 0);
    }
}
