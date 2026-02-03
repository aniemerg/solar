// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StringsInStruct.sol";

contract StringsInStructTest {
    StringsInStruct c;

    function setUp() public {
        c = new StringsInStruct();
    }

    function test_StringsInStruct() public view {
        assert(c.getFirst() == 10);
        assert(c.getSecond() == 20);
        assert(c.getThird() == 30);
        assert(keccak256(bytes(c.getLast())) == keccak256(bytes("asdfghjkl")));
    }
}
