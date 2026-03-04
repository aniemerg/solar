//@ compile-flags: -Ztypeck
// This caused a segfault in an earlier version
contract C {
    constructor() {}
}
contract D is C {
    constructor() C(5) {} //~ ERROR: wrong number of arguments for base constructor: expected 0, found 1
}
