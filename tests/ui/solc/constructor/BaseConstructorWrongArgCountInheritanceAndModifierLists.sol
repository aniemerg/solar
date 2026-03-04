contract C {
    constructor(uint, bool) {}
}

contract D is C(1, true, "a") { constructor() C(1, true, "a") {} } //~ ERROR: base constructor arguments given twice
contract E is C(1) { constructor() C(1) {} } //~ ERROR: base constructor arguments given twice
