// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BytesIndexAccess.sol";

contract BytesIndexAccessTest {
    BytesIndexAccess c;

    function setUp() public {
        c = new BytesIndexAccess();
    }

    function makeBytes() internal pure returns (bytes memory data) {
        data = new bytes(34);
        for (uint256 i = 0; i < 34; i++) {
            data[i] = bytes1(uint8(i));
        }
    }

    function test_BytesIndexAccess() public {
        bytes memory data = makeBytes();
        assert(c.direct(data, 33) == 0x21);
        assert(c.storageCopyRead(data, 33) == 0x21);
        assert(c.storageWrite() == 0x193);
    }
}
