//@ compile-flags: -Ztypeck
contract C {
    constructor(uint, bool) {}
}

contract D is C { constructor() C(1, true, "a") {} } //~ ERROR: wrong number of arguments for base constructor: expected 2, found 3
contract E is C { constructor() C(1) {} } //~ ERROR: wrong number of arguments for base constructor: expected 2, found 1
