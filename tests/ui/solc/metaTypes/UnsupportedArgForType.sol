//@ compile-flags: -Ztypeck
contract Test {
    struct S { uint x; }
    function f() public pure {
        // Unsupported for now, but might be supported in the future
        type(S); //~ ERROR: invalid type
    }
}
