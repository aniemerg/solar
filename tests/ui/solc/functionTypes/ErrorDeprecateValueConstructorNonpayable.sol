//@ compile-flags: -Ztypeck
contract C {
    constructor() {}
}
contract D {
    function createC() public returns (C) {
        C c = (new C).value(2)(); //~ ERROR: member `value` not found on type `function () returns (contract C)`
        return c;
    }
}
