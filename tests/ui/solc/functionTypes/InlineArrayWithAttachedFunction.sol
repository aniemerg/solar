//@ compile-flags: -Ztypeck
library L {
    function f(uint a) internal pure {}
    function g(uint a) internal pure {}
}
contract C {
    using L for *;
    function f() pure public {
        uint t = 8;
        [t.f, t.g][0](); //~ ERROR: member `f` not found on type `uint256`
//~^ ERROR: member `g` not found on type `uint256`
//~^^ ERROR: expected function, found `<error>[2]`
    }
}
