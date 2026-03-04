//@ compile-flags: -Ztypeck
contract X {}
contract D {
    constructor() X(5) {} //~ ERROR: expected base class or modifier, found contract
}
