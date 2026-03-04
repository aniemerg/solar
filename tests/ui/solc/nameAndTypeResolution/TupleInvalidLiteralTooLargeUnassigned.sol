//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        uint x;
        (x, ) = (1, 1E111); //~ ERROR: rational part too large
    }
}
