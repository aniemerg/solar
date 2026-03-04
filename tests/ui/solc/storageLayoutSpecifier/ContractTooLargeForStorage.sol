contract C layout at 1 {
    uint[2**256 - 1] x; //~ ERROR: failed to evaluate constant: arithmetic overflow
    uint y;
}
