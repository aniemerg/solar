//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        C c;
        c.call; //~ ERROR: member `call` not found on type `contract C`
    }
}
