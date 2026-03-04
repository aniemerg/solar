contract C {
    bytes32[8**90] ids; //~ ERROR: failed to evaluate constant: arithmetic overflow
}
