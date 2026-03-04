contract C {
    uint[8**90][500] ids; //~ ERROR: failed to evaluate constant: arithmetic overflow
}
