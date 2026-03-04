//@ compile-flags: -Ztypeck
contract C {
    uint immutable x;
    constructor() initX {
    }

    modifier initX() {
        _; x = 23; //~ ERROR: cannot assign to an immutable variable
    }
}
