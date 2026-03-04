//@ compile-flags: -Ztypeck
contract test {
    struct S { uint x; }
    constructor(uint k) { S[k]; } //~ ERROR: failed to evaluate constant: only constant variables are allowed
}
