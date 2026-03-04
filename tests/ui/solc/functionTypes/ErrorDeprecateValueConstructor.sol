//@ compile-flags: -Ztypeck
contract C {
    constructor() payable {}
}
contract D {
    function createC() public returns (C) {
        C c = (new C).value(2)(); //~ ERROR: member `value` not found on type `function () payable returns (contract C)`
        return c;
    }
}
