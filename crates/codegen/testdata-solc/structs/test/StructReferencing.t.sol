// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructReferencing.sol";

contract StructReferencingTest {
    StructReferencing c;

    function setUp() public {
        c = new StructReferencing();
    }

    function test_StructReferencing() public view {
        // C.f() -> 1 (a=1)
        I.S memory cf = c.f();
        assert(cf.a == 1);

        // C.g() -> 2 (a=2)
        I.S memory cg = c.g();
        assert(cg.a == 2);

        // C.h() -> (b=0, a=5)
        StructReferencingLib.S memory ch = c.h();
        assert(ch.b == 0 && ch.a == 5);

        // C.x() -> L.f() returns (b=0, a=3)
        StructReferencingLib.S memory cx = c.x();
        assert(cx.b == 0 && cx.a == 3);

        // C.y() -> L.g() returns (a=4)
        I.S memory cy = c.y();
        assert(cy.a == 4);

        // C.a1() -> 1 (I.S dispatch)
        assert(c.a1() == 1);

        // C.a2() -> 2 (L.S dispatch)
        assert(c.a2() == 2);
    }
}
