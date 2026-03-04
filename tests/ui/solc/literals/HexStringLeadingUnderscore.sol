contract C {
    function f() public pure {
        hex"_1234"; //~ ERROR: invalid underscore in hex literal
    }
}
