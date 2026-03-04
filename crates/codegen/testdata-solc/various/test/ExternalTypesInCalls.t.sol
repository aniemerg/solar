// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExternalTypesInCalls.sol";

contract ExternalTypesInCallsTest {
    ExternalTypesInCalls c;

    function setUp() public {
        c = new ExternalTypesInCalls();
    }

    function test_test() public {
        (C1 x, C1 y) = c.test();
        assert(address(x) == address(9));
        assert(address(y) == address(7));
    }

    function test_t2() public {
        C1 r = c.t2();
        assert(address(r) == address(9));
    }
}
