// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BitOperators.sol";

contract BitOperatorsTest {
    function test_BitOperators() public {
        BitOperators c = new BitOperators();
        (uint256 x, uint256 y, uint256 z) = c.f();
        assert(x == 3855);
        assert(y == 268374015);
        assert(z == 268370160);
    }
}
