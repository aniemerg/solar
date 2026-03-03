// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructAccessor.sol";

contract StructAccessorTest {
    StructAccessor c;

    function setUp() public {
        c = new StructAccessor();
    }

    function test_StructAccessor() public view {
        (uint256 a, uint8 b, bool d) = c.data(7);
        assert(a == 1);
        assert(b == 2);
        assert(d == true);
    }
}
