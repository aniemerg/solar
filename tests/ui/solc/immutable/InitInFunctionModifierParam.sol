//@ compile-flags: -Ztypeck
contract D {
    uint immutable t;
    modifier m(uint) { _; }
    function f() public m(t = 2) {} //~ ERROR: cannot assign to an immutable variable
}
