//@ compile-flags: -Ztypeck
contract C {
    struct S { uint address; } //~ ERROR: expected identifier, found keyword `address`
}
