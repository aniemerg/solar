// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StringCalldataToBytesCalldata.sol";

contract StringCalldataToBytesCalldataTest {
    function test_StringCalldataToBytesCalldata() public {
        StringCalldataToBytesCalldata c = new StringCalldataToBytesCalldata();
        // f(string): 0x20, 3, "abc" -> 0x20, 3, "abc"
        bytes memory result = c.f("abc");
        assert(result.length == 3);
        assert(result[0] == "a");
        assert(result[1] == "b");
        assert(result[2] == "c");
    }
}
