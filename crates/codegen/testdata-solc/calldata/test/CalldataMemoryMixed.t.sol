// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataMemoryMixed.sol";

contract CalldataMemoryMixedTest {
    CalldataMemoryMixed c;

    function setUp() public {
        c = new CalldataMemoryMixed();
    }

    function test_CalldataMemoryMixed() public {
        (uint256 len, bytes1 a, bytes1 b, bytes1 cc) = c.g();
        assert(len == 14); // 3+4+7 = 14 = 0x0e
        assert(a == 0x08);
        assert(b == 0x09);
        assert(cc == 0x0a);
    }
}
