//@ compile-flags: -Ztypeck
contract C {
    uint[-true] ids; //~ ERROR: mismatched types
//~^ ERROR: cannot apply unary operator `-` to `bool`
}
