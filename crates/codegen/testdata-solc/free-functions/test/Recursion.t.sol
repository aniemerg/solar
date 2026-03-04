// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Recursion.sol";

contract RecursionTest {
    function test_Recursion() public {
        Recursion c = new Recursion();
        assert(c.g(0, 0) == 1);
        assert(c.g(0, 1) == 0);
        assert(c.g(1, 0) == 1);
        assert(c.g(2, 3) == 8);
        assert(c.g(3, 10) == 59049);
        // 2^255 = -57896044618658097711785492504343953926634992332820282019728792003956564819968 as int256
        // as uint256: 57896044618658097711785492504343953926634992332820282019728792003956564819968
        assert(c.g(2, 255) == 57896044618658097711785492504343953926634992332820282019728792003956564819968);
    }
}
