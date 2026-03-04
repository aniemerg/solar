contract test {
    function f() pure public {
        for (;; y++){ //~ ERROR: unresolved symbol `y`
            uint y = 3;
        }
    }
}
