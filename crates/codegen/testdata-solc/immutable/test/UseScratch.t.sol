// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UseScratch.sol";

contract UseScratchTest {
    function test_UseScratch() public {
        UseScratch c = new UseScratch(3);
        (uint256 xv, uint256 yv) = c.f();
        assert(xv == 84);
        assert(yv == 23);
        assert(c.m(3) == 7);
    }
}
