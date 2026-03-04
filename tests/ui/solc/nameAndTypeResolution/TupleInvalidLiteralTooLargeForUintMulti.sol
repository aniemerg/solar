//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        uint x;
        (x, ) = (1E111, 1); //~ ERROR: rational part too large
    }
}
