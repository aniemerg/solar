//@ compile-flags: -Ztypeck
contract C {
    uint immutable x;
    constructor() {
        initX();
    }

    function initX() internal {
        x = 3; //~ ERROR: cannot assign to an immutable variable
    }
}
