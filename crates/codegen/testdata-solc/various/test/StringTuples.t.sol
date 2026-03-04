// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StringTuples.sol";

contract StringTuplesTest {
    StringTuples c;

    function setUp() public {
        c = new StringTuples();
    }

    function test_f() public {
        (string memory s, uint256 n) = c.f();
        assert(keccak256(bytes(s)) == keccak256(bytes("abc")));
        assert(n == 8);
    }

    function test_g() public {
        (string memory s1, string memory s2) = c.g();
        assert(keccak256(bytes(s1)) == keccak256(bytes("abc")));
        assert(keccak256(bytes(s2)) == keccak256(bytes("def")));
    }

    function test_h() public {
        string memory s = c.h();
        assert(keccak256(bytes(s)) == keccak256(bytes("abc")));
    }
}
