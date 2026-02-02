// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EmptyString.sol";

contract EmptyStringTest {
    EmptyString c;

    function setUp() public {
        c = new EmptyString();
    }

    function test_EmptyString() public view {
        string memory s = c.f();
        assert(bytes(s).length == 0);
    }
}
