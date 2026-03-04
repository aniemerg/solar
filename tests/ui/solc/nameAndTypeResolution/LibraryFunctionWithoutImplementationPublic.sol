//@ compile-flags: -Ztypeck
// This used to work pre-0.6.0.
library L {
    // This can be used as an "interface", hence it is allowed.
    function f() public; //~ ERROR: library functions must be implemented if declared
}
