// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/NamedArgsOverload.sol";

contract NamedArgsOverloadTest {
    NamedArgsOverload c;

    function setUp() public {
        c = new NamedArgsOverload();
    }

    function test_NamedArgsOverload() public view {
        assert(c.call(0) == 0);
        assert(c.call(1) == 1);
        assert(c.call(2) == 3);
        assert(c.call(3) == 6);
        assert(c.call(4) == 8);
        assert(c.call(5) == 500);
    }
}
