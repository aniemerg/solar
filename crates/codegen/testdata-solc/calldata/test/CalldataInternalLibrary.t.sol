// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataInternalLibrary.sol";

contract CalldataInternalLibraryTest {
    CalldataInternalLibrary c;

    function setUp() public {
        c = new CalldataInternalLibrary();
    }

    function test_CalldataInternalLibrary() public {
        bytes1 result = c.g();
        assert(result == 0x08);
    }
}
