contract C {
    function f() public pure {
        hex"12__34"; //~ ERROR: invalid underscore in hex literal
    }
}
