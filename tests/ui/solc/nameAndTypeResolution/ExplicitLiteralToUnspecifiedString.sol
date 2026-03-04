//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        string("abc"); //~ ERROR: invalid explicit type conversion
    }
}
