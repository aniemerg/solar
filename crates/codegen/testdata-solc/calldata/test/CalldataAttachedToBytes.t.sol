// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataAttachedToBytes.sol";

contract CalldataAttachedToBytesTest {
    CalldataAttachedToBytes c;

    function setUp() public {
        c = new CalldataAttachedToBytes();
    }

    function test_CalldataAttachedToBytes() public view {
        // test(7, "ab", 4) -> "b", "a"
        bytes memory b = bytes("ab");
        (bytes1 r0, bytes1 r1) = c.test(7, b, 4);
        assert(r0 == bytes1("b"));
        assert(r1 == bytes1("a"));
    }
}
