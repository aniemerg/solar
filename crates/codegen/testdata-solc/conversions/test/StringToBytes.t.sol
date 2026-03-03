// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StringToBytes.sol";

contract StringToBytesTest {
    function test_StringToBytes() public {
        StringToBytes c = new StringToBytes();
        bytes memory out = c.f("Hello");
        assert(out.length == 5);
        assert(out[0] == bytes1("H"));
        assert(out[1] == bytes1("e"));
        assert(out[2] == bytes1("l"));
        assert(out[3] == bytes1("l"));
        assert(out[4] == bytes1("o"));
    }
}
