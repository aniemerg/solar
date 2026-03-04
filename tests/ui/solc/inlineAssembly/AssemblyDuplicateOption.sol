//@ compile-flags: -Ztypeck
function f() pure {
    assembly ("memory-safe", "memory-safe") {} //~ ERROR: inline assembly marked memory-safe multiple times
}
