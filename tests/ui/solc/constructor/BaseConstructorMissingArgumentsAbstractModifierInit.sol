abstract contract C {
    constructor(uint, bool) {}
}

abstract contract D is C { constructor() C {} } //~ ERROR: modifier-style base constructor call without arguments
