// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TypeConversionCleanup.sol";

contract TypeConversionCleanupTest {
    TypeConversionCleanup c;

    function setUp() public {
        c = new TypeConversionCleanup();
    }

    function test_type_conversion() public view {
        // test() -> 0xffffffffffffffffffffffffffffffff (128-bit mask)
        uint result = c.test();
        assert(result == 0xffffffffffffffffffffffffffffffff);
    }
}
