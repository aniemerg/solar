//@ compile-flags: -Ztypeck
contract C {
    fallback () public { } //~ ERROR: `public` not allowed here; allowed values: external
}
