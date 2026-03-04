//@ compile-flags: -Ztypeck
function f() pure {
    assembly () {} //~ ERROR: expected string literal, found `)`
}
