//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        uint x;
        (x, ) = ([100e100]); //~ ERROR: rational part too large
    }
}
