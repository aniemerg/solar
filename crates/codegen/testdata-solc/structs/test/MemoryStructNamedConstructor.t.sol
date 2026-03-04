// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MemoryStructNamedConstructor.sol";

contract MemoryStructNamedConstructorTest {
    MemoryStructNamedConstructor c;

    function setUp() public {
        c = new MemoryStructNamedConstructor();
    }

    function test_MemoryStructNamedConstructor() public view {
        MemoryStructNamedConstructor.S memory result = c.s();
        assert(result.a == 8 && result.x == true);
    }
}
