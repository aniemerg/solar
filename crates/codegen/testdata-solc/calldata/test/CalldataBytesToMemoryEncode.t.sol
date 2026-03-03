// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataBytesToMemoryEncode.sol";

contract CalldataBytesToMemoryEncodeTest {
    function test_CalldataBytesToMemoryEncode() public {
        CalldataBytesToMemoryEncode c = new CalldataBytesToMemoryEncode();
        bytes memory input = "abcdefgh";
        bytes memory out = c.f(input);
        bytes memory expected = abi.encode(bytes(input));
        assert(keccak256(out) == keccak256(expected));
    }
}
