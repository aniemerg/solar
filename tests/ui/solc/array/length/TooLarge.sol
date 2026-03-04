contract C {
    uint[8**90] ids; //~ ERROR: failed to evaluate constant: arithmetic overflow
    uint[2**256-1] okay; //~ ERROR: failed to evaluate constant: arithmetic overflow
    uint[2**256] tooLarge; //~ ERROR: failed to evaluate constant: arithmetic overflow
}
