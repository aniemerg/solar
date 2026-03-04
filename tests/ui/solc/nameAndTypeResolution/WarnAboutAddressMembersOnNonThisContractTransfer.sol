//@ compile-flags: -Ztypeck
contract C {
    function f() view public {
        C c;
        c.transfer; //~ ERROR: member `transfer` not found on type `contract C`
    }
}
