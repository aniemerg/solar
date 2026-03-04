//@ compile-flags: -Ztypeck
library L {
    function f() private; //~ ERROR: library functions must be implemented if declared
}
