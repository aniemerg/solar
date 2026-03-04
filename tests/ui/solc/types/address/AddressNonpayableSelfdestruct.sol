//@ compile-flags: -Ztypeck
contract C {
    function f(address a) public {
        selfdestruct(a); //~ ERROR: mismatched types
    }
}
