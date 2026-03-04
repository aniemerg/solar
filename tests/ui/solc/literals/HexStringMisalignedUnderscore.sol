contract C {
    function f() public pure {
        hex"1_234"; //~ ERROR: invalid underscore in hex literal
    }
}
