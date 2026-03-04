//@ compile-flags: -Ztypeck
abstract contract C {
    constructor(uint, bool) {}
}

abstract contract D is C { constructor() C() {} } //~ ERROR: wrong number of arguments for base constructor: expected 2, found 0
