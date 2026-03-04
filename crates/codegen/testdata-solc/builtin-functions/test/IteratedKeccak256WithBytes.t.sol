// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/IteratedKeccak256WithBytes.sol";

contract IteratedKeccak256WithBytesTest {
    function test_IteratedKeccak256WithBytes() public {
        IteratedKeccak256WithBytes c = new IteratedKeccak256WithBytes();
        assert(c.foo() == 0xb338eefce206f9f57b83aa738deecd5326dc4b72dd81ee6a7c621a6facb7acdc);
    }
}
