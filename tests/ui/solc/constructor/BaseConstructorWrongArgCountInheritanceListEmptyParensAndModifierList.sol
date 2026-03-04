contract C {
    constructor(uint, bool) {}
}

contract D is C() { constructor() C(1, true, "a") {} } //~ ERROR: base constructor arguments given here
contract E is C() { constructor() C(1) {} } //~ ERROR: base constructor arguments given here
