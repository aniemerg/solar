// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/NegativeFractionalMod.sol";

contract NegativeFractionalModTest {
    function test_f() public {
        NegativeFractionalMod c = new NegativeFractionalMod();
        (int a, int b) = c.f();
        assert(a == 11);
        assert(b == 10);
    }
}
