//@ compile-flags: -Ztypeck
error E();
function f(bool x) pure {
    assert(x, E()); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 1
//~^ ERROR: errors can only be used with revert statements
}
