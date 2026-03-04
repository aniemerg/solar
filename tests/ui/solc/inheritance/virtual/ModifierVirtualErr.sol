//@ compile-flags: -Ztypeck
library test {
    modifier m virtual; //~ ERROR: library functions must be implemented if declared
    function f() m public {
    }
}
