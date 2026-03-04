// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StubInternal.sol";

contract StubInternalTest {
    StubInternal c;

    function setUp() public {
        c = new StubInternal();
    }

    function test_g() public {
        // g(uint256): 1 -> 1, 2 -> 4, 4 -> 16
        assert(c.g(1) == 1);
        assert(c.g(2) == 4);
        assert(c.g(4) == 16);
    }
}
