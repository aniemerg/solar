//@ compile-flags: -Ztypeck
library L {
    function f(uint a) internal pure {}
    function g(uint a) internal pure {}
}
contract C {
    using L for *;
    function f(bool x) pure public {
        uint t = 8;
        (x ? t.f : t.g)(); //~ ERROR: member `f` not found on type `uint256`
//~^ ERROR: member `g` not found on type `uint256`
    }
}
