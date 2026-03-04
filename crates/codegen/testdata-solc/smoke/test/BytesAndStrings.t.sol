// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BytesAndStrings.sol";

contract BytesAndStringsTest {
    function test_BytesAndStrings_e() public {
        BytesAndStrings c = new BytesAndStrings();
        bytes memory r1 = c.e(abi.encodePacked(bytes3(0xAB33BB)));
        assert(r1.length == 3);
        assert(r1[0] == 0xAB && r1[1] == 0x33 && r1[2] == 0xBB);

        bytes memory r2 = c.e(abi.encodePacked(bytes32(uint256(0x20))));
        assert(r2.length == 32);

        bytes memory r3 = c.e(abi.encodePacked(bytes3(0xAB33FF)));
        assert(r3.length == 3);
        assert(r3[0] == 0xAB && r3[1] == 0x33 && r3[2] == 0xFF);
    }

    function test_BytesAndStrings_f() public {
        BytesAndStrings c = new BytesAndStrings();
        (string memory s1, string memory s2) = c.f();
        assert(keccak256(bytes(s1)) == keccak256(bytes("any")));
        assert(keccak256(bytes(s2)) == keccak256(bytes("any")));
    }

    function test_BytesAndStrings_g() public {
        BytesAndStrings c = new BytesAndStrings();
        (string memory s1, uint n, string memory s2) = c.g();
        assert(keccak256(bytes(s1)) == keccak256(bytes("any")));
        assert(n == 42);
        assert(keccak256(bytes(s2)) == keccak256(bytes("any")));
    }

    function test_BytesAndStrings_h() public {
        BytesAndStrings c = new BytesAndStrings();
        string memory s = c.h();
        assert(keccak256(bytes(s)) == keccak256(bytes("any")));
    }
}
