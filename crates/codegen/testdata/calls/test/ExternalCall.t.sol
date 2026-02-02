// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExternalCall.sol";

contract ExternalCallTest {
    ExternalCall c;

    function setUp() public {
        c = new ExternalCall();
    }

    function test_ExternalCall_g() public view {
        assert(c.g(4) == 5);
    }

    function test_ExternalCall_f() public view {
        assert(c.f(2) == 5);
    }
}
