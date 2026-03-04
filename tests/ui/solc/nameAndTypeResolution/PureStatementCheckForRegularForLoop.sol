//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        for (uint x = 0; true; x++)
        {}
    }
}
