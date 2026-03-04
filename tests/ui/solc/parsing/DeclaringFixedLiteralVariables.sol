//@ compile-flags: -Ztypeck
contract A {
    fixed40x40 pi = 3.14; //~ ERROR: unresolved symbol `fixed40x40`
}
