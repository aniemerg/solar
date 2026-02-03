// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConstructorWithParams.sol";

contract ConstructorWithParamsTest {
    ConstructorWithParams c;

    function setUp() public {
        c = new ConstructorWithParams(2, 0);
    }

    function test_ConstructorWithParams() public view {
        assert(c.i() == 2);
        assert(c.k() == 0);
    }
}
