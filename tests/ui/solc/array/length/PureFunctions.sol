contract C {
    uint constant LEN = keccak256(ripemd160(33));
    uint[LEN] ids; //~ ERROR: failed to evaluate constant: unsupported expression
}
