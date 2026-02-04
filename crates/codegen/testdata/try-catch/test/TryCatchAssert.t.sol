// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TryCatchAssert.sol";

contract TryCatchAssertTest {
    function test_TryCatchAssert() public {
        TryCatchAssert c = new TryCatchAssert();
        assert(c.f(true) == 1);
        assert(c.f(false) == 2);
    }
}
