contract test {
    function f() pure public {
        x = 3; //~ ERROR: unresolved symbol `x`
        uint x;
    }
}
