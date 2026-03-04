// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InlineMemberInit.sol";

contract InlineMemberInitTest {
    InlineMemberInit c;

    function setUp() public {
        c = new InlineMemberInit();
    }

    function test_get() public {
        (uint256 a, uint256 b, uint256 cc) = c.get();
        assert(a == 5);
        assert(b == 6);
        assert(cc == 8);
    }
}
