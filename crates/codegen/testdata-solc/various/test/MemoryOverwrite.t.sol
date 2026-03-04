// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MemoryOverwrite.sol";

contract MemoryOverwriteTest {
    MemoryOverwrite c;

    function setUp() public {
        c = new MemoryOverwrite();
    }

    function test_f() public {
        bytes memory result = c.f();
        // "12345" with x[0]=0x62='b' and x[3]=0x61='a' => "b23a5"
        assert(result.length == 5);
        assert(result[0] == 0x62);
        assert(result[1] == 0x32);
        assert(result[2] == 0x33);
        assert(result[3] == 0x61);
        assert(result[4] == 0x35);
    }
}
