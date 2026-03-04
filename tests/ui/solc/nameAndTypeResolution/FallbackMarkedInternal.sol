//@ compile-flags: -Ztypeck
contract C {
    fallback () internal { } //~ ERROR: `internal` not allowed here; allowed values: external
}
