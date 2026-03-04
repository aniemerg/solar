//@ compile-flags: -Ztypeck
contract C {
    constructor(uint, bool) {}
}

contract D is C(1, true, "a") { constructor() {} } //~ ERROR: wrong number of arguments for base constructor: expected 2, found 3
contract E is C(1) { constructor() {} } //~ ERROR: wrong number of arguments for base constructor: expected 2, found 1
