// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BytesIndexAccessMemory.sol";

contract BytesIndexAccessMemoryTest {
    function test_BytesIndexAccessMemory() public {
        BytesIndexAccessMemory c = new BytesIndexAccessMemory();
        bytes memory data = bytes("abcdefghijklmnopqrstuvwxyzabcdef");
        (bytes1 c1, bytes1 c2, bytes1 c3) = c.f(data, 3, 4, 5);
        assert(c1 == bytes1("d"));
        assert(c2 == bytes1("e"));
        assert(c3 == bytes1("f"));
    }
}
