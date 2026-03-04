contract C {
    function f() public pure {
        uint[] memory x = x[0]; //~ ERROR: unresolved symbol `x`
    }
}
