//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        C c;
        c.delegatecall; //~ ERROR: member `delegatecall` not found on type `contract C`
    }
}
