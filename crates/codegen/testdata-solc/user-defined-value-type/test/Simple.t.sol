// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Simple.sol";

contract SimpleTest {
    function test_defaultValue() public {
        Simple c = new Simple();
        assert(MyInt.unwrap(c.f()) == 0);
    }

    function test_wrapValues() public {
        Simple c = new Simple();
        (MyInt b, MyInt c2) = c.g();
        assert(MyInt.unwrap(b) == 1);
        assert(MyInt.unwrap(c2) == 1);
    }
}
