//@ compile-flags: -Ztypeck
contract C {
    byte public a; //~ ERROR: expected contract item (function, variable, struct, or modifier definition), found reserved keyword `byte`
}
