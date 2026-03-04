// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyStorageAbiSigned.sol";

contract ArrayCopyStorageAbiSignedTest {
    function test_ArrayCopyStorageAbiSigned() public {
        ArrayCopyStorageAbiSigned c = new ArrayCopyStorageAbiSigned();
        // test() -> 0x20, 0x8, -1, -1, 8, -16, -2, 6, 8, -1
        int16[] memory result = c.runTest();
        assert(result.length == 8);
        assert(result[0] == -1);
        assert(result[1] == -1);
        assert(result[2] == 8);
        assert(result[3] == -16);
        assert(result[4] == -2);
        assert(result[5] == 6);
        assert(result[6] == 8);
        assert(result[7] == -1);
    }
}
