//@ compile-flags: -Ztypeck
function f() pure {
    assembly "evmasm" () {} //~ ERROR: expected string literal, found `)`
}
