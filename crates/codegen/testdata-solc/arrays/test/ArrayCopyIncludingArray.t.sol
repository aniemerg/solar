// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyIncludingArray.sol";

contract ArrayCopyIncludingArrayTest {
    function test_ArrayCopyIncludingArray() public {
        ArrayCopyIncludingArray c = new ArrayCopyIncludingArray();
        // f() -> ... (ABI-encoded dynamic values)
        (bytes memory fa, bytes memory fb) = c.f();
        assert(keccak256(fa) == keccak256("abcdef"));
        assert(keccak256(fb) == keccak256("1234567890123456789012345678901 1234567890123456789012345678901 123456789"));
        // g() -> ... (ABI-encoded dynamic values)
        (bytes memory ga, bytes memory gb) = c.g();
        assert(keccak256(ga) == keccak256("1234567890123456789012345678901 1234567890123456789012345678901 123456789"));
        assert(keccak256(gb) == keccak256("12345678923456789"));
        // h() -> 0x40, 0x60, 0x00, 0x00
        (bytes memory ha, bytes memory hb) = c.h();
        assert(ha.length == 0);
        assert(hb.length == 0);
    }
}
