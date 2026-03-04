//@ compile-flags: -Ztypeck
contract C {
    function f() view public {
        this.send; //~ ERROR: member `send` not found on type `contract C`
    }
}
