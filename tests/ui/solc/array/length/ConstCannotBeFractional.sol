contract C {
    fixed constant L = 10.5;
    uint[L] ids; //~ ERROR: failed to evaluate constant: unsupported literal
}
