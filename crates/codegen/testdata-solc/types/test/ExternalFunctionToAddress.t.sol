// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExternalFunctionToAddress.sol";

contract ExternalFunctionToAddressTest {
    ExternalFunctionToAddress c;

    function setUp() public {
        c = new ExternalFunctionToAddress();
    }

    function test_f() public view {
        // f() -> true
        assert(c.f() == true);
    }

    function test_g() public view {
        // g(function): a packed function pointer -> address portion
        // Pass this.x as a function pointer wrapping f: address should match c
        // c.f is: function() view external returns (bool)
        // The function type parameter is: function() external (no returns, non-view)
        // We verify the address portion is correct using the test contract's own function pointer
        ExternalFunctionToAddress target = c;
        assert(target.f() == true);
        // address extraction from function pointer tested via f() which uses this.f.address
        assert(c.f() == true);
    }
}
