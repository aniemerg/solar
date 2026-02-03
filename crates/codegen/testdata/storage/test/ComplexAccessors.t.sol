// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ComplexAccessors.sol";

contract ComplexAccessorsTest {
    ComplexAccessors c;

    function setUp() public {
        c = new ComplexAccessors();
    }

    function test_ComplexAccessors() public view {
        assert(c.to_string_map(42) == bytes4("24"));
        assert(c.to_bool_map(42) == false);
        assert(c.to_uint_map(42) == 12);
        assert(c.to_multiple_map(42, 23) == 31);
    }
}
