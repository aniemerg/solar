// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ValueTypes.sol";

contract ValueTypesTest {
    ValueTypes c;

    function setUp() public {
        c = new ValueTypes();
    }

    function test_getters() public view {
        assert(c.a() == 3);
        assert(c.b() == 4);
        assert(c.c() == 5);
        assert(c.d() == 6);
        assert(c.e() == bytes1(0x7f));
        assert(c.f() == bytes20(uint160(0x6465616462656566313564656164000000000010)));
        assert(c.g() == bytes32(uint256(0x6465616462656566313564656164000000000000000000000000000000000010)));
        assert(c.h() == true);
        assert(c.i() == address(type(uint160).max / 3));
    }
}
