//@ compile-flags: -Ztypeck
contract C {
    uint immutable x;
    constructor() {
        return;

        x = 1; //~ ERROR: cannot assign to an immutable variable
    }
}
