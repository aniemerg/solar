// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EnumMinMax.sol";

contract EnumMinMaxTest {
    EnumMinMax c;

    function setUp() public {
        c = new EnumMinMax();
    }

    function test_EnumMinMax() public view {
        assert(c.min() == 0);
        assert(c.max() == 3);
    }
}
