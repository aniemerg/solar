// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TryCatchSimple.sol";

contract TryCatchSimpleTest {
    function test_TryCatchSimple() public {
        TryCatchSimple c = new TryCatchSimple();
        (uint256 a, uint256 b) = c.f(true);
        assert(a == 1);
        assert(b == 2);
        (uint256 x, uint256 y) = c.f(false);
        assert(x == 9);
        assert(y == 10);
    }
}
