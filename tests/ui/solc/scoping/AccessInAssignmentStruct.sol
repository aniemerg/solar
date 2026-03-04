contract C {
    struct S { uint y; }
    function f() public pure {
        S memory x = x.y; //~ ERROR: unresolved symbol `x`
    }
}
