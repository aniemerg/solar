// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TryCatchStructuredAndLowLevel.sol";

contract TryCatchStructuredAndLowLevelTest {
    function test_TryCatchStructuredAndLowLevel() public {
        TryCatchStructuredAndLowLevel c = new TryCatchStructuredAndLowLevel();
        (uint256 x, uint256 y, bytes memory txt) = c.f(true);
        assert(x == 1);
        assert(y == 2);
        assert(keccak256(txt) == keccak256(bytes("success")));

        (x, y, txt) = c.f(false);
        assert(x == 99);
        assert(y == 0);
        bytes memory expected = bytes(
            "message longer than 32 bytes 32 bytes 32 bytes 32 bytes 32 bytes 32 bytes 32 bytes"
        );
        assert(keccak256(txt) == keccak256(expected));
    }
}
