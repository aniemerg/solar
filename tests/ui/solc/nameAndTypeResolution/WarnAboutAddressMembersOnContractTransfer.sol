//@ compile-flags: -Ztypeck
contract C {
    function f() view public {
        this.transfer; //~ ERROR: member `transfer` not found on type `contract C`
    }
}
