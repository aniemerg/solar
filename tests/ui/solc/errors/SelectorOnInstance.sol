//@ compile-flags: -Ztypeck
error E();

contract C {
    bytes4 t = E().selector; //~ ERROR: errors can only be used with revert statements
//~^ ERROR: member `selector` not found on type `tuple()`
}
