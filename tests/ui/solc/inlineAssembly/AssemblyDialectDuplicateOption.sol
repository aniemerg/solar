//@ compile-flags: -Ztypeck
function f() pure {
    assembly "evmasm" ("memory-safe", "memory-safe") {} //~ ERROR: inline assembly marked memory-safe multiple times
}
