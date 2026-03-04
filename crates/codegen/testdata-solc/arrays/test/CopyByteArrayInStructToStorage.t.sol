// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "../src/CopyByteArrayInStructToStorage.sol";

contract CopyByteArrayInStructToStorageTest {
    function test_CopyByteArrayInStructToStorage() public {
        CopyByteArrayInStructToStorage c = new CopyByteArrayInStructToStorage();

        // f() -> 0x40, 0x80, 6, "abcdef", 0x49, <long bytes>
        (bytes memory fa, bytes memory fb) = c.f();
        assert(fa.length == 6);
        assert(keccak256(fa) == keccak256(bytes("abcdef")));
        assert(fb.length == 0x49);
        assert(keccak256(fb) == keccak256(bytes("1234567890123456789012345678901 1234567890123456789012345678901 123456789")));

        // g() -> 0x40, 0xc0, 0x49, <long bytes>, 0x11, "12345678923456789"
        (bytes memory ga, bytes memory gb) = c.g();
        assert(ga.length == 0x49);
        assert(keccak256(ga) == keccak256(bytes("1234567890123456789012345678901 1234567890123456789012345678901 123456789")));
        assert(gb.length == 0x11);
        assert(keccak256(gb) == keccak256(bytes("12345678923456789")));

        // h() -> 0x40, 0x60, 0x00, 0x00
        (bytes memory ha, bytes memory hb) = c.h();
        assert(ha.length == 0);
        assert(hb.length == 0);
    }
}
