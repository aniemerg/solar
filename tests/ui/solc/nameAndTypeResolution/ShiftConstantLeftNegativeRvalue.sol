//@ compile-flags: -Ztypeck
contract C {
    uint public a = 0x42 << -8; //~ ERROR: cannot apply builtin operator `<<` to `int_literal[7]` and `int_literal[4]`
}
