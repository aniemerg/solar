// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CopyByteArrayToStorage.sol";

contract CopyByteArrayToStorageTest {
    function test_CopyByteArrayToStorage() public {
        CopyByteArrayToStorage c = new CopyByteArrayToStorage();
        // f() -> 0xff
        assert(c.f() == 0xff);
    }
}
