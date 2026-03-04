// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructContainingBytesCopyAndDelete.sol";

contract StructContainingBytesCopyAndDeleteTest {
    StructContainingBytesCopyAndDelete c;

    function setUp() public {
        c = new StructContainingBytesCopyAndDelete();
    }

    function test_StructContainingBytesCopyAndDelete() public {
        // set 33 bytes of data
        bytes memory data = new bytes(33);
        for (uint i = 0; i < 32; i++) data[i] = bytes1(uint8(i + 49)); // '1'..'0' range
        data[32] = bytes1(uint8(51)); // '3'
        assert(c.set(12, data, 13) == true);

        // check byte at index 32
        assert(c.getDataByte(32) == bytes1(uint8(51)));

        // copy resets data1 to data2 (empty)
        assert(c.copy() == true);

        // set again
        assert(c.set(12, data, 13) == true);
        // del resets data1
        assert(c.del() == true);
    }
}
