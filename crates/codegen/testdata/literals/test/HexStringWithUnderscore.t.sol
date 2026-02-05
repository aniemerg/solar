// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/HexStringWithUnderscore.sol";

contract HexStringWithUnderscoreTest {
    function test_HexStringWithUnderscore() public {
        HexStringWithUnderscore c = new HexStringWithUnderscore();
        bytes memory out = c.f();
        bytes memory expected = hex"123456789A";
        assert(out.length == expected.length);
        for (uint256 i = 0; i < expected.length; i++) {
            assert(out[i] == expected[i]);
        }
    }
}
