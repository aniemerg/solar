//@ compile-flags: -Ztypeck
contract C {
    uint immutable x;
    constructor() {
        x = 3; //~ ERROR: cannot assign to an immutable variable
        this.readX.selector;
    }

    function readX() external view returns(uint) { return x; }
}
