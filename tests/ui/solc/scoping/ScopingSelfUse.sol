contract test {
    function f() pure public {
        uint a = a; //~ ERROR: unresolved symbol `a`
    }
}
