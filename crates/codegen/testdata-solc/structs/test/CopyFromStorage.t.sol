// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CopyFromStorage.sol";

contract CopyFromStorageTest {
    CopyFromStorage c;

    function setUp() public {
        c = new CopyFromStorage();
    }

    function test_CopyFromStorage() public {
        CopyFromStorageS[] memory result = c.f();
        assert(result.length == 1);
        assert(result[0].x == 13);
    }
}
