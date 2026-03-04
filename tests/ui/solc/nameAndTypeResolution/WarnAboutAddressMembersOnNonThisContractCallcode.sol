//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        C c;
        c.callcode; //~ ERROR: member `callcode` not found on type `contract C`
    }
}
