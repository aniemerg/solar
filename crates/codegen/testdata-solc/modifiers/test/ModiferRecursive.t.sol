// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ModiferRecursive.sol";

contract ModiferRecursiveTest {
    ModiferRecursive c;

    function setUp() public {
        c = new ModiferRecursive();
    }

    function test_initial_called() public {
        assert(c.called() == 0);
    }

    function test_f_5() public {
        // f(5) = f(4)^2 = (f(3)^2)^2 = ... = 2^(2^5) = 2^32
        assert(c.f(5) == 0x0100000000);
        assert(c.called() == 6);
    }
}
