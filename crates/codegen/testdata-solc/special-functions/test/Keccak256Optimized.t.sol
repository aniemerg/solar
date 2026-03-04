// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Keccak256Optimized.sol";

contract Keccak256OptimizedTest {
    function test_short() public {
        Keccak256Optimized c = new Keccak256Optimized();
        assert(c.short() == true);
    }

    function test_long() public {
        Keccak256Optimized c = new Keccak256Optimized();
        (bool a, bool b) = c.long();
        assert(a == true);
        assert(b == true);
    }
}
