contract C {
    constructor(uint, bool) {}
}

contract D is C() {}
contract E is C() { constructor() {} }
contract F is C() { constructor() C {} } //~ ERROR: modifier-style base constructor call without arguments
contract G is C() { constructor() C() {} }

contract H is C {}
contract I is C { constructor() {} }
contract J is C { constructor() C {} } //~ ERROR: modifier-style base constructor call without arguments
contract K is C { constructor() C() {} }
