// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SimpleAccessor.sol";

contract SimpleAccessorTest {
    SimpleAccessor c;

    function setUp() public {
        c = new SimpleAccessor();
    }

    function test_SimpleAccessor() public view {
        assert(c.data() == 8);
    }
}
