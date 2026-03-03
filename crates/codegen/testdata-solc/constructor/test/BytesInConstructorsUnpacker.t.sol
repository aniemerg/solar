// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BytesInConstructorsUnpacker.sol";

contract BytesInConstructorsUnpackerTest {
    function test_BytesInConstructorsUnpacker() public {
        bytes memory s = new bytes(78);
        for (uint i = 0; i < 78; i++) {
            s[i] = bytes1(uint8(97 + (i % 26)));
        }
        BytesInConstructorsUnpacker c = new BytesInConstructorsUnpacker(7, s);
        assert(c.m_x() == 7);
        bytes memory stored = c.m_s();
        assert(stored.length == 78);
        for (uint i = 0; i < 78; i++) {
            assert(stored[i] == bytes1(uint8(97 + (i % 26))));
        }
    }
}
