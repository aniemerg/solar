//@ compile-flags: -Ztypeck
contract C {
    uint immutable x;
    constructor() {
        x = 3; //~ ERROR: cannot assign to an immutable variable
        C.selector.selector; //~ ERROR: member `selector` not found on type `type(contract C)`
        C.selector; //~ ERROR: member `selector` not found on type `type(contract C)`
    }

    function selector() external view returns(uint) { return x; }
}
