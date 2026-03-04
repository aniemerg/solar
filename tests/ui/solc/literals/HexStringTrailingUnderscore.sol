contract C {
    function f() public pure {
        hex"1234_"; //~ ERROR: invalid underscore in hex literal
    }
}
