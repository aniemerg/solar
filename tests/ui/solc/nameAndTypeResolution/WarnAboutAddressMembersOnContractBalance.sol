//@ compile-flags: -Ztypeck
contract C {
    function f() view public {
        this.balance; //~ ERROR: member `balance` not found on type `contract C`
    }
}
