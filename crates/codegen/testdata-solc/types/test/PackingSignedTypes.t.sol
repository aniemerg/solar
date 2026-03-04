// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PackingSignedTypes.sol";

contract PackingSignedTypesTest {
    PackingSignedTypes c;

    function setUp() public {
        c = new PackingSignedTypes();
    }

    function test_run() public view {
        // run() -> 0xfa interpreted as int8 = -6
        int8 result = c.run();
        // int8(0xfa) = -6 (wrapping)
        assert(result == -6);
    }
}
