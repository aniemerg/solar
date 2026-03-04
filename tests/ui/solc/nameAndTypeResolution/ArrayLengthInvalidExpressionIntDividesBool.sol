//@ compile-flags: -Ztypeck
contract C {
    uint[true/1] ids; //~ ERROR: cannot apply builtin operator `/` to `bool` and `int_literal[1]`
}
