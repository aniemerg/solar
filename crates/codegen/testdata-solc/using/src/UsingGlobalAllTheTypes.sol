// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Combined from multi-source: A (types + library L) and B (contract C)
enum E {A, B}
struct S { uint x; }
type T is uint;

library L {
    function f(E e) internal pure returns (uint) {
        return uint(e);
    }
    function f(S memory s) internal pure returns (uint) {
        return s.x;
    }
    function f(T t) internal pure returns (uint) {
        return T.unwrap(t);
    }
}

using L for E global;
using L for S global;
using L for T global;

contract UsingGlobalAllTheTypes {
    function f() public pure returns (uint a, uint b, uint c) {
        E e = E.B;
        a = e.f();
        S memory s;
        s.x = 7;
        b = s.f();
        T t = T.wrap(9);
        c = t.f();
    }
}
