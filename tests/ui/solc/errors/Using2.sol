//@ compile-flags: -Ztypeck
error E(uint);
library L {
    function f(uint) internal {}
}
contract C {
    using L for E;
    function f() public pure {
        E.f(); //~ ERROR: member `f` not found on type `error E(uint256)`
    }
}
