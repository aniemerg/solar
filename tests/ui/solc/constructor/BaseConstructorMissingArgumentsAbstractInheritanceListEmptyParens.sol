abstract contract C {
    constructor(uint, bool) {}
}

abstract contract D is C() {}
abstract contract E is C() { constructor() {} }
abstract contract F is C() { constructor() C {} } //~ ERROR: modifier-style base constructor call without arguments
abstract contract G is C() { constructor() C() {} }
