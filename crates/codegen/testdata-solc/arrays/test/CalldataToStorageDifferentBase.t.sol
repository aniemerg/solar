// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataToStorageDifferentBase.sol";

contract CalldataToStorageDifferentBaseTest {
    function test_CalldataToStorageDifferentBase() public {
        CalldataToStorageDifferentBase c = new CalldataToStorageDifferentBase();
        // f(bytes8[]): 0x20, 3, "abcd", "bcde", "cdef" -> 3, "abcd", "bcde", "cdef"
        bytes8[] memory inp = new bytes8[](3);
        inp[0] = bytes8("abcd");
        inp[1] = bytes8("bcde");
        inp[2] = bytes8("cdef");
        (uint256 len, bytes10 a, bytes10 b, bytes10 cc) = c.f(inp);
        assert(len == 3);
        assert(a == bytes10(bytes8("abcd")));
        assert(b == bytes10(bytes8("bcde")));
        assert(cc == bytes10(bytes8("cdef")));
    }
}
