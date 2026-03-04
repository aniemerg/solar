//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        string storage x = "abc"; //~ ERROR: mismatched types
    }
}
