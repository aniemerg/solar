// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CreationFunctionCallWithSalt.sol";

contract CreationFunctionCallWithSaltTest {
    function test_f_returns_2() public {
        CreationFunctionCallWithSalt d = new CreationFunctionCallWithSalt(2);
        assert(d.f() == 2);
    }
}
