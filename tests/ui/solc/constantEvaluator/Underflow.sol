contract C {
    uint8 constant a = 0;
    function f() public pure {
        uint[a - 1] memory x; //~ ERROR: failed to evaluate constant: arithmetic overflow
    }
}
