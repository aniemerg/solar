//@ compile-flags: -Ztypeck
abstract contract C {
    constructor(uint, bool) {}
}

abstract contract D is C(1, true, "a") {} //~ ERROR: wrong number of arguments for base constructor: expected 2, found 3
abstract contract E is C(1) {} //~ ERROR: wrong number of arguments for base constructor: expected 2, found 1
