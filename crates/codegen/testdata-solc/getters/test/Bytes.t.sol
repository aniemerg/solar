// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Bytes.sol";

contract BytesTest {
    Bytes c;

    function setUp() public {
        c = new Bytes();
    }

    function test_getter() public view {
        bytes memory result = c.b();
        assert(result.length == 3);
        assert(result[0] == 0x61);
        assert(result[1] == 0x62);
        assert(result[2] == 0x63);
    }
}
