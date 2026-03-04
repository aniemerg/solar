//@ compile-flags: -Ztypeck
contract C {
    function f() view public {
        this.call; //~ ERROR: member `call` not found on type `contract C`
    }
}
