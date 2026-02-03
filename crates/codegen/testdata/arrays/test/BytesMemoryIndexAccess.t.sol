// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BytesMemoryIndexAccess.sol";

contract BytesMemoryIndexAccessTest {
    function test_BytesMemoryIndexAccess() public {
        BytesMemoryIndexAccess c = new BytesMemoryIndexAccess();
        (uint256 len, bytes1 value) = c.set(bytes("abcdefgh"), 3);
        assert(len == 8);
        assert(value == bytes1("d"));
    }
}
