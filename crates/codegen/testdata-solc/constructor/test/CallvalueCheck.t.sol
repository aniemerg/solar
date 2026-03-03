// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CallvalueCheck.sol";

contract CallvalueCheckTest {
    C c;

    function setUp() public {
        c = new C();
    }

    // B1 has non-payable constructor: sending value should fail, sending 0 should succeed
    function test_f_noValue() public {
        bool result = c.f(0);
        assert(result == true);
    }

    function test_f_withValue() public {
        bool result = c.f{value: 100}(100);
        assert(result == false);
    }

    // B2 has payable constructor (via A2): sending value should succeed
    function test_g_noValue() public {
        bool result = c.g(0);
        assert(result == true);
    }

    function test_g_withValue() public {
        bool result = c.g{value: 100}(100);
        assert(result == false);
    }

    // B3 has implicit non-payable constructor
    function test_h_noValue() public {
        bool result = c.h(0);
        assert(result == true);
    }

    function test_h_withValue() public {
        bool result = c.h{value: 100}(100);
        assert(result == false);
    }

    // B4 has explicit non-payable constructor
    function test_i_noValue() public {
        bool result = c.i(0);
        assert(result == true);
    }

    function test_i_withValue() public {
        bool result = c.i{value: 100}(100);
        assert(result == false);
    }

    receive() external payable {}
}
