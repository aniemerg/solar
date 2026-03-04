//@ compile-flags: -Ztypeck
contract C {
    function f() view public {
        this.delegatecall; //~ ERROR: member `delegatecall` not found on type `contract C`
    }
}
