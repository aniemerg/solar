// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "../src/TransientStorageStateVariable.sol";

contract TransientStorageStateVariableTest {
    C c;

    function setUp() public {
        c = new C();
    }

    function test_TransientStorageStateVariable() public {
        (uint24 xv, int24 yv, uint24 wv, int24 zv) = c.f();
        assert(xv == 1);
        assert(yv == 2);
        assert(wv == 3);
        assert(zv == 4);
    }
}
