//@ compile-flags: -Ztypeck
contract C {
    error e1(uint indexed x); //~ ERROR: `indexed` is not allowed here
}
