//@ compile-flags: -Ztypeck
error E();
function f() pure {
    assert(E()); //~ ERROR: errors can only be used with revert statements
//~^ ERROR: mismatched types
}
