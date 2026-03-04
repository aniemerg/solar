//@ compile-flags: -Ztypeck
error MyCustomError(uint, bool);

contract Base {
    constructor(uint8) {}
}

contract Derived is Base(MyCustomError) {} //~ ERROR: mismatched types
