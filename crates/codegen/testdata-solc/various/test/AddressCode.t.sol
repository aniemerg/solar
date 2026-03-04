// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AddressCode.sol";

contract AddressCodeTest {
    AddressCode c;

    function setUp() public {
        c = new AddressCode();
    }

    function test_initCode_is_empty() public view {
        assert(c.initCode().length == 0);
    }

    function test_f_code_length_positive() public view {
        assert(c.f() == true);
    }

    function test_g_zero_address() public view {
        assert(c.g() == 0);
    }

    function test_h_precompile_address() public view {
        assert(c.h() == 0);
    }
}
