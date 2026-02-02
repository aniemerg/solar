// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ReturnString.sol";

contract ReturnStringTest {
    ReturnString c;

    function setUp() public {
        c = new ReturnString();
    }

    function test_ReturnString() public {
        c.set("Julia");
        string memory a = c.get1();
        string memory b = c.get2();
        string memory cval = c.s();
        assert(keccak256(bytes(a)) == keccak256(bytes("Julia")));
        assert(keccak256(bytes(b)) == keccak256(bytes("Julia")));
        assert(keccak256(bytes(cval)) == keccak256(bytes("Julia")));
    }
}
