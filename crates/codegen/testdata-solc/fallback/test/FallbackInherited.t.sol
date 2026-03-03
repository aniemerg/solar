// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FallbackInherited.sol";

contract FallbackInheritedTest {
    function test_FallbackInherited() public {
        FallbackInherited c = new FallbackInherited();

        // getData() -> 0 initially
        assert(c.getData() == 0);

        // Call fallback with some data (e.g. hex"2a" = 42)
        address(c).call(hex"2a");

        // getData() -> 1 (fallback set data = 1)
        assert(c.getData() == 1);
    }
}
