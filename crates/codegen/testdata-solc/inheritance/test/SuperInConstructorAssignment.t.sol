// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SuperInConstructorAssignment.sol";

contract SuperInConstructorAssignmentTest {
    D d;

    function setUp() public {
        d = new D();
    }

    function test_SuperInConstructorAssignment() public {
        // super.f in D's constructor context: C3 linearization D -> B -> C -> A
        // super.f from D is C.f; C.f calls super.f (B.f); B.f calls super.f (A.f)=1
        // B.f returns 1|2=3; C.f returns 3|4=7; data=7|8=15
        assert(d.f() == 15);
    }
}
