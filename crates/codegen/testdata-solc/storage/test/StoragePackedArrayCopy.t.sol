// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StoragePackedArrayCopy.sol";

contract StoragePackedArrayCopyTest {
    StoragePackedArrayCopy c;

    function setUp() public {
        c = new StoragePackedArrayCopy();
    }

    function test_StoragePackedArrayCopy() public {
        uint64[9] memory xv = c.getXAsUint();
        for (uint256 i = 0; i < 9; i++) assert(xv[i] == uint64(i));

        uint64[10] memory yv = c.getYAsUint();
        for (uint256 i = 0; i < 8; i++) assert(yv[i] == 0);
        assert(yv[8] == 2);
        assert(yv[9] == 2);

        c.copy();

        uint64[9] memory xv2 = c.getXAsUint();
        for (uint256 i = 0; i < 9; i++) assert(xv2[i] == uint64(i));

        uint64[10] memory yv2 = c.getYAsUint();
        for (uint256 i = 0; i < 9; i++) assert(yv2[i] == uint64(i));
        assert(yv2[9] == 0);
    }
}
