//@ compile-flags: -Ztypeck
function f() pure {
    assembly "evmasm" ("memory-safe") {}
}
