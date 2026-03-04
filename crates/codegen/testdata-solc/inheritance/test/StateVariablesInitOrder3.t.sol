// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StateVariablesInitOrder3.sol";

contract StateVariablesInitOrder3Test {
    B b;

    function setUp() public {
        b = new B();
    }

    function test_StateVariablesInitOrder3() public {
        // Legacy codegen (Forge default) initialization order:
        // A state vars init: a=42, b=0, c=0
        // B state vars init (before A constructor): d=f(a)=f(42) -> c=126, d=23; e=b=0
        // A constructor(17): b=42, a=17
        // B constructor: b_a=17, b_b=42, b_c=126
        assert(b.a() == 17);
        assert(b.b() == 42);
        assert(b.c() == 126);
        assert(b.b_a() == 17);
        assert(b.b_b() == 42);
        assert(b.b_c() == 126);
        assert(b.d() == 23);
        assert(b.e() == 0);
    }
}
