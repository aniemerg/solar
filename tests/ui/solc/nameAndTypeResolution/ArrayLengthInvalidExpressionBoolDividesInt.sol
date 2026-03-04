//@ compile-flags: -Ztypeck
contract C {
    uint[1/true] ids; //~ ERROR: cannot apply builtin operator `/` to `int_literal[1]` and `bool`
}
