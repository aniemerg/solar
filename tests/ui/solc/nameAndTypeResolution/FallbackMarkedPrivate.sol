//@ compile-flags: -Ztypeck
contract C {
    fallback () private { } //~ ERROR: `private` not allowed here; allowed values: external
}
