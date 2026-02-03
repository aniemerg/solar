// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InlineArrayIndexAccessStrings.sol";

contract InlineArrayIndexAccessStringsTest {
    function test_InlineArrayIndexAccessStrings() public {
        InlineArrayIndexAccessStrings c = new InlineArrayIndexAccessStrings();
        c.test();
        assert(keccak256(bytes(c.tester())) == keccak256(bytes("abc")));
    }
}
