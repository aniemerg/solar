// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/RevertBasics.sol";

contract RevertBasicsTest {
    RevertBasics c;

    function setUp() public {
        c = new RevertBasics();
    }

    function test_RevertFunction() public {
        (bool ok,) = address(c).call(abi.encodeWithSignature("f()"));
        assert(!ok);
        assert(c.a() == 42);
    }

    function test_RevertAssembly() public {
        (bool ok,) = address(c).call(abi.encodeWithSignature("g()"));
        assert(!ok);
        assert(c.a() == 42);
    }
}
