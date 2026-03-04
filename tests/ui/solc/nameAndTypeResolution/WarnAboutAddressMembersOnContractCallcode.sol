//@ compile-flags: -Ztypeck
contract C {
    function f() view public {
        this.callcode; //~ ERROR: member `callcode` not found on type `contract C`
    }
}
