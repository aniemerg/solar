//@ compile-flags: -Ztypeck
contract C {
    function f() view public {
        C c;
        c.send; //~ ERROR: member `send` not found on type `contract C`
    }
}
