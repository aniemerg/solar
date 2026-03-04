// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Strings.sol";

contract StringsTest {
    Strings c;

    function setUp() public {
        c = new Strings();
    }

    function test_roundtrip() public view {
        string memory result = c.roundtrip("hello world");
        assert(keccak256(bytes(result)) == keccak256(bytes("hello world")));
    }

    function test_utf8len_emoji() public view {
        // "😃😃😃😃" - 4 emoji, each 4 bytes in UTF-8 = 16 bytes, but 4 Unicode code points
        bytes memory emoji = "\xf0\x9f\x98\x83\xf0\x9f\x98\x83\xf0\x9f\x98\x83\xf0\x9f\x98\x83";
        assert(c.utf8len(string(emoji)) == 4);
    }

    function test_multiconcat() public view {
        // multiconcat("hello world", 3) -> concatenate 2^3 = 8 times "hello world"
        // Result length = 8 * 11 = 88 bytes
        string memory result = c.multiconcat("hello world", 3);
        assert(bytes(result).length == 88);
    }

    function test_benchmark() public view {
        // benchmark("solidity", 0x0842021) -> 0x2020 = 8224
        assert(c.benchmark("solidity", bytes32(uint256(0x0842021))) == 0x2020);
    }
}
