// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BytesStorageToStorage.sol";

contract BytesStorageToStorageTest {
    function test_BytesStorageToStorage() public {
        BytesStorageToStorage c = new BytesStorageToStorage();

        // f(uint256): 0 -> 0x20, 0x00
        bytes memory r0 = c.f(0);
        assert(r0.length == 0);

        // f(uint256): 31 -> 0x20, 0x1f, 0x0102...
        bytes memory r31 = c.f(31);
        assert(r31.length == 31);
        for (uint i = 0; i < 31; i++) {
            assert(r31[i] == bytes1(uint8(i)));
        }

        // f(uint256): 32
        bytes memory r32 = c.f(32);
        assert(r32.length == 32);

        // f(uint256): 33
        bytes memory r33 = c.f(33);
        assert(r33.length == 33);

        // f(uint256): 12
        bytes memory r12 = c.f(12);
        assert(r12.length == 12);
        for (uint i = 0; i < 12; i++) {
            assert(r12[i] == bytes1(uint8(i)));
        }
    }
}
