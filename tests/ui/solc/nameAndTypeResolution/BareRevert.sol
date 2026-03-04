//@ compile-flags: -Ztypeck
contract C {
    function f(uint x) pure public {
        if (x > 7)
            revert; //~ ERROR: no matching declarations found
    }
}
