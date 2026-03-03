// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCalldataFixed.sol";

contract ArrayCalldataFixedTest {
    ArrayCalldataFixed c;

    function setUp() public {
        c = new ArrayCalldataFixed();
    }

    function test_ArrayCalldataFixed() public view {
        (uint256 a, uint256 b) = c.f([uint256(42), uint256(23)]);
        assert(a == 42);
        assert(b == 23);
    }
}
