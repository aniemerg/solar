//@ compile-flags: -Ztypeck
library L {
    function f() internal; //~ ERROR: library functions must be implemented if declared
}
