// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TryCatchRequire.sol";

contract TryCatchRequireTest {
    function test_TryCatchRequire() public {
        TryCatchRequire c = new TryCatchRequire();
        assert(c.f(true) == 1);
        assert(c.f(false) == 2);
    }
}
