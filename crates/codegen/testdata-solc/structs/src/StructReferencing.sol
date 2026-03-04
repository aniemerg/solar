// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface I {
    struct S {
        uint a;
    }
}

library StructReferencingLib {
    struct S {
        uint b;
        uint a;
    }

    function f() public pure returns (S memory) {
        S memory s;
        s.a = 3;
        return s;
    }

    function g() public pure returns (I.S memory) {
        I.S memory s;
        s.a = 4;
        return s;
    }

    function a(I.S memory) public pure returns (uint) {
        return 1;
    }

    function a(S memory) public pure returns (uint) {
        return 2;
    }
}

contract StructReferencing is I {
    function f() public pure returns (S memory) {
        S memory s;
        s.a = 1;
        return s;
    }

    function g() public pure returns (I.S memory) {
        I.S memory s;
        s.a = 2;
        return s;
    }

    function h() public pure returns (StructReferencingLib.S memory) {
        StructReferencingLib.S memory s;
        s.a = 5;
        return s;
    }

    function x() public pure returns (StructReferencingLib.S memory) {
        return StructReferencingLib.f();
    }

    function y() public pure returns (I.S memory) {
        return StructReferencingLib.g();
    }

    function a1() public pure returns (uint) {
        S memory s;
        return StructReferencingLib.a(s);
    }

    function a2() public pure returns (uint) {
        StructReferencingLib.S memory s;
        return StructReferencingLib.a(s);
    }
}
