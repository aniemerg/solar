// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConstantStringLiteral.sol";

contract ConstantStringLiteralTest {
    ConstantStringLiteral c;

    function setUp() public {
        c = new ConstantStringLiteral();
    }

    function test_ConstantStringLiteral() public view {
        bytes32 b = c.b();
        assert(b == bytes32("abcdefghijklmnopq"));
        assert(c.getB() == b);
        assert(c.unused() == 2);
        assert(keccak256(bytes(c.x())) == keccak256(bytes("abefghijklmnopqabcdefghijklmnopqabcdefghijklmnopqabca")));
        assert(keccak256(bytes(c.getX())) == keccak256(bytes("abefghijklmnopqabcdefghijklmnopqabcdefghijklmnopqabca")));
        assert(keccak256(bytes(c.getX2())) == keccak256(bytes("abefghijklmnopqabcdefghijklmnopqabcdefghijklmnopqabca")));
    }
}
