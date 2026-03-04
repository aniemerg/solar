//@ compile-flags: -Ztypeck
// This tests a crash that occurred because we did not stop for fatal errors.
contract C {
    struct S {
        ftring a; //~ ERROR: unresolved symbol `ftring`
    }
    S public s;
    function s() public s { //~ ERROR: identifier `s` already declared
//~^ ERROR: symbol `s` resolved to multiple declarations
    }
}
