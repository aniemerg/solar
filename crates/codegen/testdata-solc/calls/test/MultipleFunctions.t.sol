// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MultipleFunctions.sol";

contract MultipleFunctionsTest {
    MultipleFunctions c;

    function setUp() public {
        c = new MultipleFunctions();
    }

    function test_MultipleFunctions() public view {
        assert(c.a() == 0);
        assert(c.b() == 1);
        assert(c.c() == 2);
        assert(c.f() == 3);
    }

    function test_MultipleFunctions_NonExisting() public {
        (bool ok,) = address(c).call(abi.encodeWithSignature("i_am_not_there()"));
        assert(!ok);
    }
}
