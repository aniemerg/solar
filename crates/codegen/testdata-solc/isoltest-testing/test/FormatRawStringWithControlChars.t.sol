// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FormatRawStringWithControlChars.sol";

contract FormatRawStringWithControlCharsTest {
    FormatRawStringWithControlChars c;

    function setUp() public {
        c = new FormatRawStringWithControlChars();
    }

    function test_f_roundtrip_emoji() public view {
        // Input: "😃😃😃😃" (UTF-8: \xf0\x9f\x98\x83 repeated 4 times)
        bytes memory emoji = "\xf0\x9f\x98\x83\xf0\x9f\x98\x83\xf0\x9f\x98\x83\xf0\x9f\x98\x83";
        string memory result = c.f(string(emoji));
        assert(keccak256(bytes(result)) == keccak256(emoji));
    }
}
