//@ compile-flags: -Ztypeck
contract C {
    function f() view public {
        C c;
        c.balance; //~ ERROR: member `balance` not found on type `contract C`
    }
}
