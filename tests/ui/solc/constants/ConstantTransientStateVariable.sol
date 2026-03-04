//@ compile-flags: -Ztypeck
contract C {
    int constant public transient x = 0; //~ ERROR: transient cannot be used as data location for constant or immutable variables
//~^ ERROR: initialization of transient storage state variables is not supported
}
